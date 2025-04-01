function formatCPF(input) {
    let value = input.value.replace(/\D/g, '');
    value = value.substring(0, 11);
    value = value.replace(/(\d{3})(\d)/, '$1.$2');
    value = value.replace(/(\d{3})(\d)/, '$1.$2');
    value = value.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
    input.value = value;
}

function formatTelefone(input) {
    let value = input.value.replace(/\D/g, '');
    value = value.substring(0, 11);
    if (value.length > 10) {
        value = value.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
    } else {
        value = value.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
    }
    input.value = value;
}

function formatCardNumber(input) {
    let value = input.value.replace(/\D/g, '');
    value = value.substring(0, 16);
    value = value.replace(/(\d{4})(?=\d)/g, '$1 ');
    input.value = value;
}

function formatDate(input) {
    let value = input.value.replace(/\D/g, '');
    value = value.substring(0, 4);
    
    if (value.length > 2) {
        value = value.substring(0, 2) + '/' + value.substring(2);
        let month = parseInt(value.substring(0, 2));
        if (month > 12) {
            value = '12' + value.substring(2);
        }
    }
    
    input.value = value;
} 