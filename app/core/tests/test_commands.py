"""
Test custom Django management commands.
"""
from unittest.mock import patch

from django.core.management import call_command
from django.db.utils import OperationalError
from django.test import SimpleTestCase


@patch('django.db.utils.ConnectionHandler.__getitem__')
class CommandTests(SimpleTestCase):
    """Test commands."""

    def test_wait_for_db_ready(self, patched_getitem):
        """Test waiting for database if database ready."""
        patched_getitem.return_value = True

        call_command('wait_for_db')

        patched_getitem.assert_called_once()

    @patch('time.sleep')
    def test_wait_for_db_delay(self, patched_sleep, patched_getitem):
        """Test waiting for database when getting OperationalError."""
        patched_getitem.side_effect = [OperationalError] * 2 + [True]

        call_command('wait_for_db')

        self.assertEqual(patched_getitem.call_count, 3)
        patched_sleep.assert_called_with(1)