Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.75])
 by mx.groups.io with SMTP id smtpd.web11.5573.1588315664062666692
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 23:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xm37slIM;
 spf=pass (domain: arm.com, ip: 40.107.2.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DmKOP2PpHZnXVgjtW8reDmCTaVcDVLcaTx5FhNg6zw=;
 b=xm37slIMc18SktWOPsV3oHBxwguUMgbLMKzgd3O+AYS6t2zr+4GQC02ejyYpjs4Q7fiefO86k5ZsDaorhDVaavNsr7gMqiLykVJ5iNcFEjXgn7h+0cf5X30MgoyRsKP6E06UqT7cHnLEQxn0e/J0OEoIVO+ybLoO0IxFwiYaiWA=
Received: from AM3PR03CA0068.eurprd03.prod.outlook.com (2603:10a6:207:5::26)
 by VI1PR0801MB2109.eurprd08.prod.outlook.com (2603:10a6:800:8a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 06:47:41 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:5:cafe::a9) by AM3PR03CA0068.outlook.office365.com
 (2603:10a6:207:5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Fri, 1 May 2020 06:47:41 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 06:47:40 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Fri, 01 May 2020 06:47:40 +0000
X-CR-MTA-TID: 64aa7808
Received: from 4a368a4b45d6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6D02F88E-89F9-4C34-A801-3FE0C12FA0CB.1;
	Fri, 01 May 2020 06:47:35 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a368a4b45d6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 May 2020 06:47:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cbv8OgkVUFESiZROBVDV0FFyWZw8n9enhW0Ft9OPDHG+hMqLuZEPZ47gYPLi9IZu5xpQQkUCcDM0mijMmvWlRM/82DX51RBXk/PzFRt81n4+eKL2LtOaiRYW1AJVlQDVaxQDXe0G2J9F4aRMvxLHV7xBQiAfkbfPFJ8gKe5Onn0wE9j0fBpaqSxwes8aBlwjbRDUUZZYwKMGEg4sTB1vD1P+BN60X7uNcCoCLX3TtqyvKxOLEd+LLJkbLXZNOtN77ki0fRYB1P1Wp8hohwiEuy3/5s9F1Z1Hg3uMfA/re90lU5srB4hHxGeqN+VaTX7wqyt7PoF/0qvyv2Dwj16Vtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DmKOP2PpHZnXVgjtW8reDmCTaVcDVLcaTx5FhNg6zw=;
 b=djArHK1V/us9Ip0f0RwOVf/ZJoe8E1pSRJCC73x5CwXQbBC0xojx4i1/S5Ohd3ik+94j8bJ/wn6AXL6T/rxG3ils/Omm3FLIr0rHsYRBzP2tiDEW7IMG0IHMsbjEgMCxYhSg6OEaouJ+4ygwGl9idD4HVQhXevue/MWDzjqC0TEGKwyRVl9rbogL7SocOISFKBNWWO0PSRWi6VCr5lbd6eqQ8VDb0+b3yPWOcDiXP3sVxrTLh5fxb91MYrkq7LTTrQDbtWsPJl35Onmwddd/F/QlABoHLYqOZq9kPA68Ef81OJ/DPdtSsWE7K9GG6sxx+QD2iGlcrAFiyjrhiyC0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DmKOP2PpHZnXVgjtW8reDmCTaVcDVLcaTx5FhNg6zw=;
 b=xm37slIMc18SktWOPsV3oHBxwguUMgbLMKzgd3O+AYS6t2zr+4GQC02ejyYpjs4Q7fiefO86k5ZsDaorhDVaavNsr7gMqiLykVJ5iNcFEjXgn7h+0cf5X30MgoyRsKP6E06UqT7cHnLEQxn0e/J0OEoIVO+ybLoO0IxFwiYaiWA=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5330.eurprd08.prod.outlook.com (2603:10a6:208:17f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 06:47:33 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 06:47:33 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/4] external-arm-toolchain: drop unnecessary binutils-cross-${TARGET_ARCH} in PROVIDES
Thread-Topic: [meta-arm] [PATCH 2/4] external-arm-toolchain: drop unnecessary
 binutils-cross-${TARGET_ARCH} in PROVIDES
Thread-Index: AQHWHqVRsMC3jO1V7E6ataP+0QA4Q6iRb5GAgAFbsMA=
Date: Fri, 1 May 2020 06:47:33 +0000
Message-ID: 
 <AM0PR08MB3987318C2373DE2F4280F49992AB0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1588219828-34791-1-git-send-email-denis@denix.org>
 <1588219828-34791-2-git-send-email-denis@denix.org>
 <CAFA6WYMqhFL5AgeOECMB73gikOGY_HxMOHkXz0sBfm_9uqCvUg@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYMqhFL5AgeOECMB73gikOGY_HxMOHkXz0sBfm_9uqCvUg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 305fd0f8-4a8a-4514-8b8e-4955a4cf590b.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [188.221.127.70]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a740bc5-fd5d-4e29-6477-08d7ed9b8b5a
x-ms-traffictypediagnostic: AM0PR08MB5330:|VI1PR0801MB2109:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB2109BB1604F462A870C7D0DA92AB0@VI1PR0801MB2109.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
x-forefront-prvs: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kgkc4dLH8Z4b6ZYd2Q1rh/m+5FDaRFgE0feRCq269fVM/wMQB9hrnJ1TfVaXPHaBWpliTLUPn3u6uQzvpsqetGMOmmrRmac1CE29wbrDDwqqo/EvEnH2GbMKFdJcYUPZWq9P5DsXpCJZ1KpKB3hWaLYI/rdLx8zCB0yldPfbjgpdyQxKREdHN6FGsastg7xFtSixBv+DGsDV0AdWFIEaB9rlb36QHfE2OIBGL4Rc48We8igtiz+ieEAdhsLr3wQ58UA958vxdRuSVLHwcCbtNgg0ZBkZ5CH/cdEnVqXMz50NV9u4pcp27pduBRxSRK4dzjN0E2xHjQ7OsQ0SUudjoroWC9JgF4wt/CEKwpJ/IcoShoZqGHD/sa6zTZH0FbKR1GegjAQNvcsNwzOojkSPrQ/D7BY0ry8R8QdDnAlVibon/R1Y/sVN0OazSfkv5seTKL2aK7H4Ta02M3F4QZGmsKUhgY2Mv1DBWjWXjhb6iCh2C8lBwxqbPXbvhS6lzPTFtNoCRSFpA1NAB86rsjDU2pzKzhVDOn2DIjHEwmoI8kO9N2oXcdeZKOdgMG0wCt06UIDAlCKJAdR7wkxdTligKw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(186003)(2906002)(26005)(8936002)(316002)(6506007)(53546011)(52536014)(8676002)(478600001)(55016002)(76116006)(966005)(86362001)(9686003)(33656002)(6916009)(4326008)(71200400001)(66556008)(64756008)(7696005)(5660300002)(66446008)(66476007)(66946007)(54906003)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Yg9INHdJAq4e0YUU5nUG6Pp5ow+6KlbWxOJsni8K/33yrzkOzQgGmuCR7RXf3kH7UtkZSH8Y0TG93zOwN9G1YvWCnSsKOvxpp+u17t6JQWMdXIaguk/CzkJiUkZCfsUQGkvvRW79FsC6Sn8JJpgk59ur+MPF4J6yuS8XkRGmiKApezFlXNYJuYT0yrTjAaaGsnz9DE9KLU84c2ZROZD4nwwbil4LVhvq8UKuD3r/40S16pE5gRpjDXab/wXxQMWgZjV9wg2Wnz+n6CmE9CuDq13mDFFREqqoFVCj90GHjSaTIAmCA9T/UB7FVTUgryoBnix64mws5EYDppRKXOe/q7w+A5wLLGVPXrbD55EEEmiX/FHItERLe7vZT3djGM7EtBdQfepriiTdJo1fEnpLOvETjOdgoJo+TO4le45tFVaZhNc3DT386LnnDEkDj3rEcCmTg7gm+vQ1Q8GSJ/upQll99M39er/0tBa7/Pl1I2eQQw+XPRjPszDhUjrffaoVFC7iimvgttG9Ng08Jf87oT3Oz3kO82bLB06phMaiBel2GjUwNJYK+A7hS7VlMFx7odd+Lo5ph9Tl4yH4hYnDFuA5LPMa/i6/NqNQscSprCLZn+fkNCWgk6/KJ4CxsrBBXl+5G03gb3vHpVsoCuJgkHUmkWg/98sgkMhcx/V5y2yPoVjbawL6xBktkne3QsMIJF8hosJ9B9WxYjO6WIQ7Mm0TZiP0Ox4GsxTBs9Wep/a6WEH0zfphVl7zwqIyqSdRAeLlAJfwcslcucNm2oRdxuUe0BIrpzCFvr4AFeGX8ws=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5330
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(186003)(7696005)(356005)(9686003)(6506007)(53546011)(55016002)(26005)(8936002)(47076004)(336012)(5660300002)(4326008)(6916009)(82740400003)(33656002)(2906002)(36906005)(316002)(966005)(86362001)(81166007)(478600001)(70586007)(70206006)(82310400002)(52536014)(54906003)(8676002)(228453006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8f6c30c6-184e-4527-4aea-08d7ed9b8712
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ew+A8FWroBj3rnSpb5+/JKj3WN4LUl3iomthUU1/SUwxuAsGZV8qwBSNkIImxtB44ziJViz2EHSBH/gA7hUWWIbZKuVoW1T9kRpTHVrybpuuy+02sLO0Bzr5nys48Stz89f+znqQ6q8swFUYK8ebBxMZ52KX1Vet17w/C4wMNdnprT5A+6alYWTrXQEg6TaWDv/SL1ZU1887q6y2pAi3S4CaZW8kk3bQvIPgYbqD7Tzs9e5HkvV3VIUPg0c4yDioWf6ynyCkiC+t56ZK3MeA5WwdTGuyDO00zcy6oJriCOzcbNHT11NwbRqSu/MJeb62HdRAsYDGxLx/tlnq8uIdkbOOoCIe+L3X/DIyYGAzz0hsSiXLjpcSasd3t1SWS1IirfZULXCoiDvgQysovHArPfNsyIBJJyYjCA79HHR1AXPwMl7shtG+YNbNPDWdpFltuHzce0g+dn8k7Xn6VBljAeSweiU5K6k/jZHxBEHmo/GRm+4c6gR9a0hENlJxgz04HnTGtIqW26RQTfLiuyeAoQZCLYLB0SnSBtmIvbSONNJ2g++mi3VWJ8VfS+sjj1eFz+ALzogCFljPftGJOBFpwPpNpEl2RUlJ4p2I02LTwODJH6lRzxAlAzgWQMWa0KDz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 06:47:40.9245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a740bc5-fd5d-4e29-6477-08d7ed9b8b5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2109
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLWFybUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBPbiBCZWhh
bGYgT2YgU3VtaXQgR2FyZyB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiAzMCBB
cHJpbCAyMDIwIDExOjAyDQo+IFRvOiBtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IENjOiBEZW55cyBEbXl0cml5ZW5rbyA8ZGVueXNAdGkuY29tPg0KPiBTdWJqZWN0OiBSZTogW21l
dGEtYXJtXSBbUEFUQ0ggMi80XSBleHRlcm5hbC1hcm0tdG9vbGNoYWluOiBkcm9wDQo+IHVubmVj
ZXNzYXJ5IGJpbnV0aWxzLWNyb3NzLSR7VEFSR0VUX0FSQ0h9IGluIFBST1ZJREVTDQo+IA0KPiBP
biBUaHUsIDMwIEFwciAyMDIwIGF0IDA5OjQwLCBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVu
aXgub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IERlbnlzIERteXRyaXllbmtvIDxkZW55c0B0
aS5jb20+DQo+ID4NCj4gPiBUaGVyZSdzIG5vIG5lZWQgdG8gZGlyZWN0bHkgcHJvdmlkZSBiaW51
dGlscy1jcm9zcy0ke1RBUkdFVF9BUkNIfSwgYXMNCj4gPiB0aGUgUFJPVklERVMgbGlzdCBhbHJl
YWR5IGNvbnRhaW5zIHZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWJpbnV0aWxzDQo+ID4gYW5kIGNv
cnJlY3QgUFJFRkVSUkVEX1BST1ZJREVSIGlzIHNldCBpbiB0aGUgY29ycmVzcG9uZGluZyB0Y21v
ZGUtDQo+IGV4dGVybmFsLWFybS5pbmMgZmlsZToNCj4gPg0KPiA+IFBSRUZFUlJFRF9QUk9WSURF
Ul92aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1iaW51dGlscyA9ICJleHRlcm5hbC1hcm0tDQo+IHRv
b2xjaGFpbiINCj4gPg0KPiA+IFNpbWlsYXIgdG8gdGhlIGNvbXBpbGVyOg0KPiA+DQo+ID4gUFJF
RkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWdjYyA9ICJleHRlcm5hbC1h
cm0tDQo+IHRvb2xjaGFpbiINCj4gPiBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC8ke1RBUkdF
VF9QUkVGSVh9Z2NjLWluaXRpYWwgPSAiZXh0ZXJuYWwtDQo+IGFybS10b29sY2hhaW4iDQo+ID4g
UFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWcrKyA9ICJleHRlcm5h
bC1hcm0tDQo+IHRvb2xjaGFpbiINCj4gPg0KPiA+IEFuZCBzaW1pbGFyIHRvIGdsaWJjOg0KPiA+
DQo+ID4gUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWxpYmMtZm9y
LWdjYyA9ICJleHRlcm5hbC0NCj4gYXJtLXRvb2xjaGFpbiINCj4gPiBQUkVGRVJSRURfUFJPVklE
RVJfdmlydHVhbC8ke1RBUkdFVF9QUkVGSVh9Y29tcGlsZXJsaWJzID0gImV4dGVybmFsLQ0KPiBh
cm0tdG9vbGNoYWluIg0KPiA+DQo+ID4gVGhlcmUgc2hvdWxkbid0IGJlIGFueSBkaXJlY3QgZGVw
ZW5kZW5jeSBvbg0KPiA+IGJpbnV0aWxzLWNyb3NzLSR7VEFSR0VUX0FSQ0h9LiBBbmQgaWYgdGhl
cmUgaXMsIGl0IG5lZWRzIHRvIGJlIGZpeGVkDQo+ID4gdG8gZGVwZW5kIG9uIHZpcnR1YWwvJHtU
QVJHRVRfUFJFRklYfWJpbnV0aWxzDQo+ID4NCj4gPiBEdXJpbmcgOC54IHVwZ3JhZGUgdGhlcmUg
d2FzIGFuIGF0dGVtcHQgdG8gY2xlYW4gaXQgdXA6DQo+ID4NCj4gPiBodHRwczovL2dpdC5saW5h
cm8ub3JnL29wZW5lbWJlZGRlZC9tZXRhLWxpbmFyby5naXQvY29tbWl0L21ldGEtbGluYXJvDQo+
ID4gLXRvb2xjaGFpbi9yZWNpcGVzLWRldnRvb2xzL2V4dGVybmFsLWFybS10b29sY2hhaW4vZXh0
ZXJuYWwtYXJtLXRvb2xjaA0KPiA+IGFpbi5iYj9pZD1hOGNlM2RjNDdmM2JlOWY5OGFiYzZhYzk4
YTg0OWY5MTgzODZjZjlmDQo+ID4NCj4gPiBCdXQgdW5mb3J0dW5hdGVseSwgaXQgZ290IHJlLWFk
ZGVkIGJhY2sgdy9vIHJlYXNvbmluZzoNCj4gPg0KPiA+IGh0dHBzOi8vZ2l0LmxpbmFyby5vcmcv
b3BlbmVtYmVkZGVkL21ldGEtDQo+IGxpbmFyby5naXQvY29tbWl0Lz9pZD1iYjA0YmM4DQo+ID4g
YzY3ZmQwMzJmZTA0YzQ3YjIxNjNlYTVmYTZiMmZmYTg2DQo+ID4NCj4gPiBBbHNvLCB3aGlsZSBh
dCBpdCwgZml4IGluZGVudGF0aW9uIGZvciBnbGliYy1tdHJhY2UgaW4gUFJPVklERVMgbGlzdC4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERlbnlzIERteXRyaXllbmtvIDxkZW55c0B0aS5jb20+
DQoNClJldmlld2VkLWJ5OiBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bhcm0uY29tPg0KDQo+
ID4gLS0tDQo+ID4gIC4uLi9yZWNpcGVzLWRldnRvb2xzL2V4dGVybmFsLWFybS10b29sY2hhaW4v
ZXh0ZXJuYWwtYXJtLXRvb2xjaGFpbi5iYg0KPiA+IHwgMyArLS0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBSZXZpZXdlZC1i
eTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPg0KPiANCj4gPiBkaWZmIC0tZ2l0
DQo+ID4gYS9tZXRhLWFybS10b29sY2hhaW4vcmVjaXBlcy1kZXZ0b29scy9leHRlcm5hbC1hcm0t
dG9vbGNoYWluL2V4dGVybmFsLQ0KPiA+IGFybS10b29sY2hhaW4uYmINCj4gPiBiL21ldGEtYXJt
LXRvb2xjaGFpbi9yZWNpcGVzLWRldnRvb2xzL2V4dGVybmFsLWFybS10b29sY2hhaW4vZXh0ZXJu
YWwtDQo+ID4gYXJtLXRvb2xjaGFpbi5iYg0KPiA+IGluZGV4IGRkZDNhZmYuLjMzZDZjMzUgMTAw
NjQ0DQo+ID4gLS0tDQo+ID4gYS9tZXRhLWFybS10b29sY2hhaW4vcmVjaXBlcy1kZXZ0b29scy9l
eHRlcm5hbC1hcm0tdG9vbGNoYWluL2V4dGVybmFsLQ0KPiA+IGFybS10b29sY2hhaW4uYmINCj4g
PiArKysgYi9tZXRhLWFybS10b29sY2hhaW4vcmVjaXBlcy1kZXZ0b29scy9leHRlcm5hbC1hcm0t
dG9vbGNoYWluL2V4dGVyDQo+ID4gKysrIG5hbC1hcm0tdG9vbGNoYWluLmJiDQo+ID4gQEAgLTE1
LDE0ICsxNSwxMyBAQCBQUk9WSURFUyArPSAiXA0KPiA+ICAgICAgICAgdmlydHVhbC8ke1RBUkdF
VF9QUkVGSVh9ZysrIFwNCj4gPiAgICAgICAgIHZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWdjYy1p
bml0aWFsIFwNCj4gPiAgICAgICAgIHZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWJpbnV0aWxzIFwN
Cj4gPiAtICAgICAgICBiaW51dGlscy1jcm9zcy0ke1RBUkdFVF9BUkNIfSBcDQo+ID4gICAgICAg
ICB2aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1saWJjLWZvci1nY2MgXA0KPiA+ICAgICAgICAgdmly
dHVhbC8ke1RBUkdFVF9QUkVGSVh9Y29tcGlsZXJsaWJzIFwNCj4gPiAgICAgICAgIHZpcnR1YWwv
bGliYyBcDQo+ID4gICAgICAgICB2aXJ0dWFsL2xpYmludGwgXA0KPiA+ICAgICAgICAgdmlydHVh
bC9saWJpY29udiBcDQo+ID4gICAgICAgICB2aXJ0dWFsL2NyeXB0IFwNCj4gPiAtICAgICAgICBn
bGliYy1tdHJhY2UgXA0KPiA+ICsgICAgICAgZ2xpYmMtbXRyYWNlIFwNCj4gPiAgICAgICAgIGds
aWJjLXRocmVhZC1kYiBcDQo+ID4gICAgICAgICBnbGliYyBcDQo+ID4gICAgICAgICBsaWJjLW10
cmFjZSBcDQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+ID4NCg==
