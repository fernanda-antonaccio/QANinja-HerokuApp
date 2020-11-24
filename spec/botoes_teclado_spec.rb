
describe 'Pressionando Botões do Teclado', :teclado do

    before(:each) do
        visit '/key_presses'
    end

    it 'Inserindo Array de Simbolos', :array_simbolos do
        teclas = %i[tab escape space enter shift control alt]
        teclas.each do |i|
            find('#campo-id').send_keys i
            expect(page).to have_content 'You entered: ' + i.to_s.upcase
        end
    end

    it 'Inserindo Array de Letras', :array_letras do
        teclas = %w[a b c d e f g]
        teclas.each do |i|
            find('#campo-id').send_keys i
            expect(page).to have_content 'You entered: ' + i.to_s.upcase
        end
    end
end