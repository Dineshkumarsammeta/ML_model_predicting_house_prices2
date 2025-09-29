import joblib
from sklearn.metrics import r2_score, mean_squared_error
from src.pipeline import build_pipeline
from src.save_metrics import save_metrics

# Assume you already have X_train, X_test, y_train, y_test loaded

# 1. Train model
pipeline = build_pipeline()
pipeline.fit(X_train, y_train)

# 2. Save trained model
joblib.dump(pipeline, "models/house_price_model.pkl")

# 3. Evaluate on test set
y_pred = pipeline.predict(X_test)
r2 = r2_score(y_test, y_pred)
rmse = mean_squared_error(y_test, y_pred, squared=False)

print(f"Model performance → R²: {r2:.4f}, RMSE: {rmse:.2f}")

# 4. Save metrics (this is where you add the example usage)
save_metrics(
    dataset="house_prices",
    split="train/test",
    model="RandomForestPipeline",
    r2=r2,
    rmse=rmse,
    n_train=len(X_train),
    n_test=len(X_test),
    seed=42,
)
