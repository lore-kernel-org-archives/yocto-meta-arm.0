Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.58])
 by mx.groups.io with SMTP id smtpd.web12.4768.1586418415971474314
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2020 00:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kRIPLs5Z;
 spf=pass (domain: arm.com, ip: 40.107.6.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDXqDhdHTvXe3YG59i0hlBsXV4myv0gq3ADZnD6giis=;
 b=kRIPLs5Z3fAdlyxCG7bbzpb42Tq63BtlJEIkzpct5qKmHHcHiOur0uRywa7bhTaBH/Kq0afFptNM5CITlXpMTUwzCHiutHFk/+qzkvepcsq7qgFb8+ueMY0txfY8b2CnuILGqHQIFOIeNjOOkLkeaFBOIZpmvG0fM8zP9MdVLjY=
Received: from DB8PR03CA0015.eurprd03.prod.outlook.com (2603:10a6:10:be::28)
 by VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Thu, 9 Apr
 2020 07:46:53 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::7d) by DB8PR03CA0015.outlook.office365.com
 (2603:10a6:10:be::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend
 Transport; Thu, 9 Apr 2020 07:46:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 07:46:53 +0000
Received: ("Tessian outbound 9e48e1321951:v50"); Thu, 09 Apr 2020 07:46:53 +0000
X-CR-MTA-TID: 64aa7808
Received: from 30a54915669a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2B39C740-5884-4109-BE81-14FE85D0F539.1;
	Thu, 09 Apr 2020 07:46:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30a54915669a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Apr 2020 07:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AL3k/J/oIp9Onv9mwWb23RRKvgFVsfdOZaHorVe9uFaJ4aEjmHmaaJ8LK5fOyeHejmzs/ySmOmMQQhHbmvAT4/EnmpjNcOgiuJgWBWsseE5lnaxupecbcCcSoKkBp2n0VR884/8ysH8pDWwLMgTQb7CPTrPENGC6dUtWX2/pm/GMhUSXGpqdKbt1C/QMoBVaLCEog3CK3sesAQXwoBYzRVXY2Gtckhb9BF4KrK6aQnj2oUv9i7r1oz9qVmQIfYJKXepxpY/90kVwp1fo+1UtSUgmO4Hhix7eU5zbFVJM2zi/88Z2rvQQI2YW0F11g24i6pdFqP3PhTCt4ypQgbBm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDXqDhdHTvXe3YG59i0hlBsXV4myv0gq3ADZnD6giis=;
 b=aYsxkFQe5VKzZ+upkBh+lqqwIN1S8tFssiuz7EYpSFDLpOZwtK3CcjbgOZAI5dG25e2bizZu9mtmVUri3AQU+VF8hCFdGqRUhYVMp1Bnd1A4VsFei5A2COg4eYI72DopoaFkzu5xWXztbNGPZ2GjIUHFh/jLkecv7HVV5Fv3N61GY+nLZc1kFwCjHbEodOSGVkw/28JEBMbrD7Xhl9WONxVO7umMHQFC5KfPVI2mzE+dfwyiKrFpChCBuGgB/yNJwK9b+dQJp0GTP4E9rGqVSx5dihx/a91zMcqGc1wpmKYLoS4REsY+Bb4z8nW3Mf6WGtrYiySiITedB5vu5y68Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDXqDhdHTvXe3YG59i0hlBsXV4myv0gq3ADZnD6giis=;
 b=kRIPLs5Z3fAdlyxCG7bbzpb42Tq63BtlJEIkzpct5qKmHHcHiOur0uRywa7bhTaBH/Kq0afFptNM5CITlXpMTUwzCHiutHFk/+qzkvepcsq7qgFb8+ueMY0txfY8b2CnuILGqHQIFOIeNjOOkLkeaFBOIZpmvG0fM8zP9MdVLjY=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5266.eurprd08.prod.outlook.com (2603:10a6:208:162::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Thu, 9 Apr
 2020 07:46:42 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2900.015; Thu, 9 Apr 2020
 07:46:42 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Sumit Garg
	<sumit.garg@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Jon
 Mason <Jon.Mason@arm.com>, "riku.voipio@linaro.org" <riku.voipio@linaro.org>,
	"denis@denix.org" <denis@denix.org>, "daniel.thompson@linaro.org"
	<daniel.thompson@linaro.org>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball insted of svn
Thread-Topic: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar
 ball insted of svn
Thread-Index: AQHWDjhGcV6Deo57UEmNCJnzx13GhahwW4lAgAAGs4CAAAQVAIAAAc1w
Date: Thu, 9 Apr 2020 07:46:42 +0000
Message-ID: 
 <AM0PR08MB398737C167CFC7BD15A553BD92C10@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
 <AM0PR08MB3987BA60B6716249954D79A592C10@AM0PR08MB3987.eurprd08.prod.outlook.com>
 <CAFA6WYP1u0qGV4HR+a9-cLa+6B=BZamGqJBOTMFt+Xv6ENdHag@mail.gmail.com>
 <CAP71Wjy_=WWJ24SUwaXK7akOt5P7knVZ2+MnSUjmHb77R0oVbQ@mail.gmail.com>
In-Reply-To: 
 <CAP71Wjy_=WWJ24SUwaXK7akOt5P7knVZ2+MnSUjmHb77R0oVbQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 12db3b1f-a31d-4373-bf94-6a096c639d2a.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f03d4792-f474-450d-8512-08d7dc5a2baf
x-ms-traffictypediagnostic: AM0PR08MB5266:|AM0PR08MB5266:|VI1PR08MB3629:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB36291D199B1C023069BD1CE492C10@VI1PR08MB3629.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0368E78B5B
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(4326008)(7696005)(6506007)(53546011)(71200400001)(316002)(110136005)(54906003)(2906002)(8676002)(81156014)(8936002)(55016002)(9686003)(33656002)(966005)(478600001)(81166007)(186003)(5660300002)(66446008)(64756008)(66476007)(66556008)(76116006)(66946007)(52536014)(26005)(86362001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nkhxiT4T12SzLEp3K0zyCmgENPsr3EiVYixSa8Y6qMEyg6cR3hEvzLdEzFfpLFqJCZ97WKszOhA5sbYdszHOk6k57kVm8kieUZiyMY1TvCPDEcYO8AVwbE1oYPBEPo30zW4QR+ZxQirlq7Xg80spRSk7WSsZoqsM7udA4sNSAD122dd65PwiHEYDz7VoNeVuWyv4Ez9jCFFwO/eF/UEJ7Q6a39MbGcdTfg3SAYDas018fY2PRFz0Rsq5t6torzA5u1B/rNkDLp0IjSrf6CfL+F44EY+Az0vDBaHzCMyhyRTRQgnkZhsjBmzMcfmTnx+XPIvfjvNZDeqBmJolHXynxN+Xeu7emntIfDn25tsrYJBmyw8aSYUPp6ErtBh/1i8uW3bhjD4nZKHVX7j6UKk3954nhZVqWDn0vlJKA2pxNagBpJ+EalvtM4Ngrenw4pWVRpQuNb+kYk2hJhh+rbbLUrXVjNlDZa0Rjsavy6utSFfklOHlQZH7CBVtQXkGM3h3MI+/syiW/+UB3PHZafp3jg==
x-ms-exchange-antispam-messagedata: 
 hTurkSk+Ftn5/CMkYL6tn76x6vyE027+IKTT/yPVVcSZ9Ax3IFsyy1BfN8n1rwXkkMeLNkx6UJW13Q4aaK1yY6eO1ucrNsapilfxhZmjhzkJD2sWjzeX+pFbcWdnLsE0wk7nvZfZUSH3ZD3aJ/nWLw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5266
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(70206006)(47076004)(26005)(186003)(110136005)(26826003)(33656002)(52536014)(54906003)(81156014)(316002)(8936002)(356004)(81166007)(4326008)(82740400003)(86362001)(2906002)(70586007)(55016002)(7696005)(478600001)(9686003)(6506007)(5660300002)(53546011)(8676002)(966005)(336012);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1f1d5125-607a-48ee-55e5-08d7dc5a2521
X-Forefront-PRVS: 0368E78B5B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r/MyqyazA/7ERbCrkWBJWWQ7NzltWPmDENwvEUZFalb0J/SkYyjdhKIRImk5JjcZHHH3IhucCGqbsMlaXDHj6taLHp0I6ZwcpLNU0OliZ6mFfZj5xmPSdDiQ4I21Krdo9u8Cie3bqDuyjWdi/gunnj9qEI9X78BVoyfI5dPFpqegP5cc/ne6zKKb2gPvNn6a/0jWCr+4KFJpdBOlDIPEiYvbVC1u4pHrJ4I9r0u8lGqjCs7iT2UcW0ghRm+dC7Bmd0t1GARRTPZvZajmf6fLYV2W6nNwVFMPVw6YMM9ICwiqADe263uMvH4XdDLAvkghBcdPCit2HSnB18pcLm8TacRmQkVahDgUwUlkIBUTG1NwwgU/wdnm8YcPORFoa1mYVvifdxaC/1CCMlQtswTl3EnSFWj7UDK+Ox4B9bGB4k4ZLpAyWNhoKGa7pDEP/luY15XEdMxH1C9f5p0ijUqFsHtVM6U5pgbHYmWX0pQbFUaEFQB9nCMetRwfKeBUKiDGlUX/CgprdFg7aM+HzSj15MQtyZ6zxtEplXkeNBnAOo9Vv/0o6PRd9YWEpE6TMkIjGceeSJlw6KVL10JwUnG5dA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 07:46:53.4154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f03d4792-f474-450d-8512-08d7dc5a2baf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3629
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogTmljb2xhcyBEZWNoZXNuZSA8bmljb2xhcy5kZWNoZXNuZUBsaW5hcm8ub3JnPiANClNl
bnQ6IDA5IEFwcmlsIDIwMjAgMDg6MzUNClRvOiBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGxpbmFy
by5vcmc+DQpDYzogRGllZ28gU3VlaXJvIDxEaWVnby5TdWVpcm9AYXJtLmNvbT47IG1ldGEtYXJt
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IEpvbiBNYXNvbiA8Sm9uLk1hc29uQGFybS5jb20+OyBy
aWt1LnZvaXBpb0BsaW5hcm8ub3JnOyBkZW5pc0BkZW5peC5vcmc7IGRhbmllbC50aG9tcHNvbkBs
aW5hcm8ub3JnOyBuZCA8bmRAYXJtLmNvbT4NClN1YmplY3Q6IFJlOiBbbWV0YS1hcm1dIFtQQVRD
SF0gbWV0YS1hcm0tdG9vbGNoYWluOiB1c2UgR0NDIDkuMiBzb3VyY2UgdGFyIGJhbGwgaW5zdGVk
IG9mIHN2bg0KDQoNCg0KT24gVGh1LCBBcHIgOSwgMjAyMCBhdCA5OjIwIEFNIFN1bWl0IEdhcmcg
PG1haWx0bzpzdW1pdC5nYXJnQGxpbmFyby5vcmc+IHdyb3RlOg0KT24gVGh1LCA5IEFwciAyMDIw
IGF0IDEyOjM2LCBEaWVnbyBTdWVpcm8gPG1haWx0bzpEaWVnby5TdWVpcm9AYXJtLmNvbT4gd3Jv
dGU6DQo+DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBtYWlsdG86
bWV0YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8bWFpbHRvOm1ldGEtYXJtQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmc+DQo+ID4gT24gQmVoYWxmIE9mIFN1bWl0IEdhcmcgdmlhIGh0dHA6Ly9s
aXN0cy55b2N0b3Byb2plY3Qub3JnDQo+ID4gU2VudDogMDkgQXByaWwgMjAyMCAwNzozMA0KPiA+
IFRvOiBtYWlsdG86bWV0YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiA+IENjOiBKb24g
TWFzb24gPG1haWx0bzpKb24uTWFzb25AYXJtLmNvbT47IG1haWx0bzpuaWNvbGFzLmRlY2hlc25l
QGxpbmFyby5vcmc7DQo+ID4gbWFpbHRvOnJpa3Uudm9pcGlvQGxpbmFyby5vcmc7IG1haWx0bzpk
ZW5pc0BkZW5peC5vcmc7IG1haWx0bzpkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZzsNCj4gPiBT
dW1pdCBHYXJnIDxtYWlsdG86c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPg0KPiA+IFN1YmplY3Q6IFtt
ZXRhLWFybV0gW1BBVENIXSBtZXRhLWFybS10b29sY2hhaW46IHVzZSBHQ0MgOS4yIHNvdXJjZSB0
YXIgYmFsbA0KPiA+IGluc3RlZCBvZiBzdm4NCj4gPg0KPiA+IEdDQyA5LjIgc291cmNlIGZldGNo
IGZyb20gc3ZuIGlzIHF1aXRlIHNsb3cgYXMgY29tcGFyZWQgdG8gc291cmNlIHRhciBiYWxsLg0K
PiA+IFNvIHN3aXRjaCB0byBmZXRjaCBHQ0MgOS4yIHNvdXJjZSB0YXIgYmFsbCBpbnN0ZWFkLg0K
PiA+DQo+ID4gUmVwb3J0ZWQtYnk6IFJpa3UgVm9pcGlvIDxtYWlsdG86cmlrdS52b2lwaW9AbGlu
YXJvLm9yZz4NCj4gPiBTdWdnZXN0ZWQtYnk6IE5pY29sYXMgRGVjaGVzbmUgPG1haWx0bzpuaWNv
bGFzLmRlY2hlc25lQGxpbmFyby5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgR2FyZyA8
bWFpbHRvOnN1bWl0LmdhcmdAbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPsKgIG1ldGEtYXJtLXRv
b2xjaGFpbi9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtYXJtLTkuMi5pbmMgfCA5ICsrKystLS0t
LQ0KPiA+wqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLWFybS10b29sY2hhaW4vcmVjaXBlcy1kZXZ0b29s
cy9nY2MvZ2NjLWFybS05LjIuaW5jIGIvbWV0YS0NCj4gPiBhcm0tdG9vbGNoYWluL3JlY2lwZXMt
ZGV2dG9vbHMvZ2NjL2djYy1hcm0tOS4yLmluYw0KPiA+IGluZGV4IDM2NmEwNzAuLjA4ZThmN2Yg
MTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1hcm0tdG9vbGNoYWluL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy1hcm0tOS4yLmluYw0KPiA+ICsrKyBiL21ldGEtYXJtLXRvb2xjaGFpbi9yZWNpcGVzLWRl
dnRvb2xzL2djYy9nY2MtYXJtLTkuMi5pbmMNCj4gPiBAQCAtMjcsMTAgKzI3LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJcDQo+ID7CoCDCoCDCoCBmaWxlOi8vQ09QWUlORy5SVU5USU1FO21kNT1m
ZTYwZDg3MDQ4NTY3ZDRmZThjOGEwZWQyNDQ4YmNjOCBcwqAgIg0KPiA+DQo+ID4gLSNCQVNFVVJJ
ID89ICIke0dOVV9NSVJST1J9L2djYy9nY2MtJHtQVn0vZ2NjLSR7UFZ9LnRhci54eiINCj4gPiAt
I1JFTEVBU0UgPz0gIjVhNWNhMmQiDQo+ID4gLSNCQVNFVVJJID89ICJodHRwczovL3JlcG8ub3Iu
Y3ovb2ZmaWNpYWwtDQo+ID4gZ2NjLmdpdC9zbmFwc2hvdC8ke1JFTEVBU0V9LnRhci5nejtkb3du
bG9hZGZpbGVuYW1lPWdjYy0NCj4gPiAke1JFTEVBU0V9LnRhci5neiINCj4gPiAtQkFTRVVSSSA/
PQ0KPiA+ICJzdm46Ly9odHRwOi8vZ2NjLmdudS5vcmcvc3ZuL2djYy9icmFuY2hlcy9BUk07cmV2
PTI3NzQzOTttb2R1bGU9YXJtLTktDQo+ID4gYnJhbmNoIg0KPiA+ICtCQVNFVVJJID89ICJodHRw
czovL2RldmVsb3Blci5hcm0uY29tLy0vbWVkaWEvRmlsZXMvZG93bmxvYWRzL2dudS0NCj4gPiBh
LzkuMi0yMDE5LjEyL3NyY3JlbC9nY2MtYXJtLXNyYy1zbmFwc2hvdC05LjItMjAxOS4xMi50YXIu
eHoiDQo+DQo+IEFueSBzcGVjaWZpYyByZWFzb24gZm9yIGhhdmluZyBhIHNvZnRlciBhc3NpZ25t
ZW50IGhlcmU/IEFyZSB3ZSBleHBlY3RpbmcNCj4gdGhlIHVzZXIgdG8gY3VzdG9taXplIHRoaXMg
dmFyaWFibGU/DQoNCj4gPiBUaGlzIHRyZW5kIGhhcyBiZWVuIGZvbGxvd2VkIG9uIGZyb20gT0Ut
Y29yZSBnY2MgcmVjaXBlcy4gQUZBSUssIHRoaXMNCj4gPiB3aWxsIGJlIHVzZWZ1bCBpbiBjYXNl
IHRoZSBzb3VyY2UgcGFja2FnZSBpcyBob3N0ZWQgc29tZXdoZXJlIGVsc2UNCj4gPiBsaWtlIGxv
Y2FsIHN0b3JhZ2UgZXRjLiBVc2VyIGNhbiBzaW1wbHkgb3ZlcnJpZGUgdGhpcyB2YXJpYWJsZSB2
aWENCj4gPiAiLmJiYXBlbmQiLg0KDQo+ID4gPiB0aGlzIGlzIGNvcnJlY3QuIFRoZSB3aG9sZSBw
b2ludCBvZiBoYXZpbmcgQkFTRVVSSSBpbiB0aGUgZmlyc3QgcGxhY2UgaXMgdG8gYWxsIGEgJ3Vz
ZXInIHRvIG92ZXJyaWRlIGl0LiBPdGhlcndpc2UgdGhlIGxpbmsgd291bGQgYmUgYWRkZWQgdG8g
U1JDX1VSSSBkaXJlY3RseS4NCg0KQnV0IHRoZSB1c2VyIGNhbiBzdGlsbCBvdmVycmlkZSBpdCBm
cm9tIGEgLmJiYXBwZW5kIGlmIHRoZSBtYWluIHJlY2lwZSB1c2VzDQpkaXJlY3QgYXNzaWdubWVu
dCBzaW5jZSBpdCB3aWxsIGJlIHBhcnNlZCBsYXRlci4NCg0KSSB1bmRlcnN0YW5kIHRoZSBtb3Rp
dmF0aW9uIG5vdywgYW5kIHRoZSBzb2Z0ZXIgYXNzaWdubWVudCBtYWtlcyBzZW5zZQ0KaGVyZSBp
ZiB3ZSBleHBlY3QgdGhlIHVzZXIgdG8gY3VzdG9taXplIGl0IGZyb20gLmNvbmYgZmlsZSwgZm9y
IGV4YW1wbGUuDQoNCj4NCj4gPsKgIFNSQ19VUkkgPSAiXA0KPiA+wqAgwqAgwqAgwqAgwqAgwqAg
wqAke0JBU0VVUkl9IFwNCj4gPsKgIMKgIMKgIMKgIMKgIMKgIMKgZmlsZTovLzAwMDEtZ2NjLTQu
My4xLUFSQ0hfRkxBR1NfRk9SX1RBUkdFVC5wYXRjaCBcIEBAIC03MSw3DQo+ID4gKzY4LDkgQEAg
U1JDX1VSSSA9ICJcDQo+ID7CoCDCoCDCoCDCoCDCoCDCoCDCoGZpbGU6Ly8wMDM2LVJlLWludHJv
ZHVjZS1zcGUtY29tbWFuZGxpbmUtb3B0aW9ucy5wYXRjaCBcDQo+ID7CoCDCoCDCoCDCoCDCoCDC
oCDCoGZpbGU6Ly8wMDM3LUZpeC11cC1saWJzYW5pdGl6ZXItYnVpbGQtd2l0aC1tYXN0ZXItZ2xp
YmMucGF0Y2ggXMKgICINCj4gPiAtUyA9ICIke1RNUERJUn0vd29yay1zaGFyZWQvZ2NjLSR7UFZ9
LSR7UFJ9L2FybS05LWJyYW5jaCINCj4gPiArU1JDX1VSSVttZDVzdW1dID0gIjljNTcwZmM0Mjg2
ODI1YjRlNmY2N2IzZDM0YWFkZTIzIg0KPiA+ICsNCj4gPiArUyA9ICIke1RNUERJUn0vd29yay1z
aGFyZWQvZ2NjLSR7UFZ9LSR7UFJ9L2djYy1hcm0tc3JjLXNuYXBzaG90LTkuMi0NCj4gPiAyMDE5
LjEyIg0KPiA+DQo+ID7CoCAjIEZvciBkZXYgcmVsZWFzZSBzbmFwc2hvdHRpbmcNCj4gPsKgICNT
ID0gIiR7VE1QRElSfS93b3JrLXNoYXJlZC9nY2MtJHtQVn0tJHtQUn0vb2ZmaWNpYWwtZ2NjLSR7
UkVMRUFTRX0iDQo+ID4gLS0NCj4gPiAyLjcuNA0KPg0K
