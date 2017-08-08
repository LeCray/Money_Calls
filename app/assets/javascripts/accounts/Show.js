var Show = (function() {

	var $btnNewTransaction;
	var $btnSave;
	var $inputAmount;
	var $modalTransaction;
	var $selectTransactionType;

	var fetchElements = function() {
		$btnNewTransaction 		= $("#btn-new-transaction");
		$btnSave 	       		= $('#btn-save');
		$inputAmount       		= $('#input-amount');
		$modalTransaction  		= $('#modal-transaction');
		$selectTransactionType 	= $('#select-transaction-type');
	};

	var initializeEvents = function() {
		$btnNewTransaction.on("click", function() {
			$modalTransaction.modal('show');
		});
	};

	var init = function() {
		fetchElements();
		initializeEvents();
	};

	return {
		init: init 
	};
})();
