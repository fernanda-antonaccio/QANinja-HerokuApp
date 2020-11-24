
describe 'Modals com Sweet Alert', :select2 do

    describe('Single') do
       
        before(:each) do
            visit '/apps/select2/single.html'
        end

        it 'Seleciona ator por nome', :single do
            find('.select2-selection--single').click
            find('.select2-results__option', text: 'Adam Sandler').click
        end

        it 'Busca ator por nome', :singleBusca do
            find('.select2-selection--single').click
            find('.select2-search__field').set 'Chris Rock'
            find('.select2-results__option', text: 'Chris Rock').click
        end
    end

    describe('Multiple') do
        
        before(:each) do
            visit '/apps/select2/multi.html'
        end

        def selecione(ator)
            find('.select2-selection--multiple').click
            find('.select2-results__option', text: ator).click
        end

        it 'seleciona atores', :multi do
            selecione('Jim Carrey')
            selecione('Chris Rock')
        end
    end
end