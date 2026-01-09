from app import db, app

if __name__ == "__main__":
    with app.app_context():
        print("Running database migrations...")
        db.create_all()
        print("Database migrations completed.")
