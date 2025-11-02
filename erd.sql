
CREATE TABLE reg_logTB (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('CSD','CJED','HTM','EDPSYCOM','Admin')),
    reset_token VARCHAR(64),
    reset_expires TIMESTAMP,
    email_verified BOOLEAN DEFAULT FALSE,
    verification_token VARCHAR(100),
    temp_password VARCHAR(255),
    temp_password_expires TIMESTAMP
);

-- 3️⃣ Materials Table
CREATE TABLE materials (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    icon VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE
);

-- 4️⃣ Bookings Table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES reg_logTB(id) ON DELETE CASCADE,
    booking_title VARCHAR(255) NOT NULL,
    venue VARCHAR(255) NOT NULL,
    booking_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    organizer VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT now(),
    rejection_reason TEXT,
    total_amount NUMERIC(10,2) DEFAULT 0.00,
    payment_method VARCHAR(50) DEFAULT 'cash',
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending','approved','confirmed','rejected')),
    payment_status VARCHAR(10) DEFAULT 'unpaid' CHECK (payment_status IN ('unpaid','paid')),
    payment_reference VARCHAR(255),
    paid_at TIMESTAMP
);

-- 5️⃣ Booking Edit Requests Table
CREATE TABLE booking_edit_requests (
    id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    user_id INT NOT NULL REFERENCES reg_logTB(id) ON DELETE CASCADE,
    requested_changes TEXT NOT NULL CHECK (requested_changes::json IS NOT NULL),
    reason TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    admin_notes TEXT,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);

-- 6️⃣ Booking Materials Table
CREATE TABLE booking_materials (
    id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(id) ON DELETE CASCADE,
    material_id INT REFERENCES materials(id),
    quantity INT DEFAULT 0
);

-- 7️⃣ Events Table
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    venue VARCHAR(255),
    organizer VARCHAR(255),
    created_at TIMESTAMP DEFAULT now()
);

-- 8️⃣ Notifications Table
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    type VARCHAR(20) DEFAULT 'info' CHECK (type IN ('success','info','warning','alert')),
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT now()
);

-- ✅ Optional: Insert sample data (from your dump)
INSERT INTO reg_logTB (id, name, email, password, role, reset_token, reset_expires, email_verified, verification_token)
VALUES
(66, 'FRANCIS LANCELOT ESQUILLA', 'lanceesquilla03@gmail.com', 'hashed_password_here', 'Admin', NULL, NULL, TRUE, NULL),
(77, 'Esquilla francis lancelot', 'esquilla.francislancelot@ncst.edu.ph', 'hashed_password_here', 'CJED', NULL, NULL, TRUE, NULL),
(78, 'ailly', 'ramil.aillymae@ncst.edu.ph', 'hashed_password_here', 'CSD', NULL, NULL, TRUE, NULL);

DROP TABLE materia
