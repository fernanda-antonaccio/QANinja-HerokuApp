
describe 'Hovers', :hovers do

    before(:each) do
        visit '/hovers'
    end

    it 'Mouse sobre Blade', :hover_blade do 
        card = find('img[alt="Blade"]')
        card.hover
        expect(page).to have_content 'Nome: Blade'
    end

    it 'Mouse sobre Pantera Negra', :hover_pantera do 
        card = find('img[alt*="Negra"]') # * = contem
        card.hover
        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'Mouse sobre Homem Aranha', :hover_aranha do 
        card = find('img[alt^="Homem"]') # ^ = inicia
        card.hover
        expect(page).to have_content 'Nome: Homem Aranha'
    end

    it 'Mouse sobre Homem Aranha', :hover_aranha2 do 
        card = find('img[alt$="Aranha"]') # $ = termina
        card.hover
        expect(page).to have_content 'Nome: Homem Aranha'
    end
end