--adding check to verify postal code correctness

ALTER TABLE ADDRESSES ADD CONSTRAINT postal_code_check CHECK (
        POSTAL_CODE similar to '\d{2}-\d{3}'
);