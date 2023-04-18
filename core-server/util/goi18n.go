package util

import (
	"encoding/json"
	"github.com/nicksnyder/go-i18n/v2/i18n"
	"golang.org/x/text/language"
)

var ProcheLocalizer *i18n.Localizer //1
var bundle *i18n.Bundle             //2

func init() {
	bundle = i18n.NewBundle(language.English)            //3
	bundle.RegisterUnmarshalFunc("json", json.Unmarshal) //4
	_, _ = bundle.LoadMessageFile("resources/en.json")   //6
	_, _ = bundle.LoadMessageFile("resources/fr.json")   //7
	ProcheLocalizer = i18n.NewLocalizer(bundle, language.English.String(), language.French.String())
}
