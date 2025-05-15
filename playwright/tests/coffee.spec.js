import { test, expect } from '@playwright/test';

test('Buy Espresso 2 cups with success', async ({ page }) => {
  await page.goto('https://seleniumbase.io/coffee/');
  await page.locator('[data-test="Espresso2"]').click();
  await page.locator('[data-test="Espresso"]').click();
  await page.getByRole('link', { name: 'Cart page' }).click();
  await expect(page.locator('[data-test="checkout"]')).toContainText('Total: $20.00');
  await expect(page.locator('#app')).toContainText('Espresso');
  await expect(page.locator('#app')).toContainText('$20.00');
  await page.locator('[data-test="checkout"]').click();
  await expect(page.getByRole('heading')).toContainText('Payment details');
  await page.getByRole('textbox', { name: 'Name' }).click();
  await page.getByRole('textbox', { name: 'Name' }).fill('somkiat');
  await page.getByRole('textbox', { name: 'Email' }).click();
  await page.getByRole('textbox', { name: 'Email' }).fill('somkiat@xxx.com');
  await page.getByRole('checkbox', { name: 'Promotion checkbox' }).check();
  await page.getByRole('button', { name: 'Submit' }).click();
});