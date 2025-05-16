import { test, expect } from '@playwright/test';

test('First page of coffee shop', async ({ page }) => {
  await page.goto('https://seleniumbase.io/coffee/');
  await page.locator('[data-test="Espresso"]').click();
  await expect(page.locator('[data-test="Espresso"]')).toHaveScreenshot();
});