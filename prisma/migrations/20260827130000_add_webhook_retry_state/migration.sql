ALTER TABLE "WebhookDelivery"
  ADD COLUMN IF NOT EXISTS "attemptCount" INTEGER NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS "nextRetryAt" TIMESTAMP(3),
  ADD COLUMN IF NOT EXISTS "status" TEXT NOT NULL DEFAULT 'pending',
  ADD COLUMN IF NOT EXISTS "lastError" TEXT;

CREATE INDEX IF NOT EXISTS "WebhookDelivery_status_nextRetryAt_idx"
  ON "WebhookDelivery"("status", "nextRetryAt");
