Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE9EC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 10:21:38 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web11.94968.1709547688953899628
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 02:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=j6tRP6gs;
 spf=pass (domain: siemens.com, ip: 40.107.15.70, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DI9r+icqc2Bo0Br3P0fcjalxSvjBnzlHFpWUmgZ3ZRDOz6r6vdyfzzCcHI/ZIeDHNoMLNWBrSDdBjMSTzP3lLF2+hqkACv/JyvrEBrwiVfnxERSIPLXi7iT83HXR36rl0gBVrOwuxTCt+vc5GeHy/XRJ5m99rb4givLAqTQHTB9OT5AtYwE3CbhUWuoceRgVE5pOj6F93h3wDKBbh3zL/XIMrbaaDOQlJnkQ86Mg/eOTL1GLax3Ik0p7JGgTudyPX1PyFy0m5DPIE2sZNlvTG+rddSvqQgWTA9hjYrrTdO0KHSMZpTfDWzxMbc34dgJRoDP+dcTv+QEDc9whCOP25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woXjQ6SyAFQz++idGzVhq0Dt7LLIi1XmzO6tsp2gc7s=;
 b=cCaGeSW/T5SBEyUV/MNS7CdHvF3stiRzwcal9bOBYkJPVei1vJBR3AGWYe6MI0sexTb5z+/35VIZJHbj5kZYwW8ic9x2Mrce6W3HpkE918B2MxuiHVw/al3BO2OsHjEWHfpxySaNfqXNhlcpCFE7+jQLPZCuszYGOeay52wvnQIL1bWI97T8fHHZm3KBX4NXCHzGlSh2KTQLrFO4WWFl/7v5z4OJdlyZmQONnNO7zSyqFgXzqTUaLUSrPyosIH9TTCTFSRxDgYYW8jEdB4kMbEbfORRpBtqeh7umWfqQ/rC33sh0cFDsa39Ot2ph6CUh13cBShLyOg1tUOziawjqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woXjQ6SyAFQz++idGzVhq0Dt7LLIi1XmzO6tsp2gc7s=;
 b=j6tRP6gs45TnRdevLFjNm3fUa8LaztqD6C1GKLD1PLYx2DorPtArcGSuvbAJHDKM0ceBHgXxYotnqbtPmgcxq5gjnzO4yUvGDogdArsy+UXVPxEoeUzC2k/LxPTnpQQrKr0NgCRhbwaHUxcwYChOHn5BTO3uLqGXSTINqv7chZKBys/VxXKVmUC+HIRCln6D0GFHvsSRA/GdIivRW5si9mf8ugOH5FOHwmtiPVvGrbdxKtUhCoHiY2IfmHe6Q9qtEKSw5quRWB5rF7K8DscYfz/0E6lwwV/atE18HBo3rI8Cwq3uAaPGQ279ISTa9a4lKfCdRhNHZamcdp0CjPNZqQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB6515.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:83::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 10:21:21 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ab67:6d35:16b1:81c8]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ab67:6d35:16b1:81c8%3]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 10:21:21 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	"meng.li@windriver.com" <meng.li@windriver.com>
Subject: Re: [meta-arm] [PATCH] arm/optee-client: set parameter
 CFG_TEE_PLUGIN_LOAD_PATH as ${libdir}
Thread-Topic: [meta-arm] [PATCH] arm/optee-client: set parameter
 CFG_TEE_PLUGIN_LOAD_PATH as ${libdir}
Thread-Index: AQHabefZ6RtnRHGPG0Gxj6j8imROC7EnX5eA
Date: Mon, 4 Mar 2024 10:21:21 +0000
Message-ID: <c47249fa9711f9000a5e73a3d1057640245c0e2b.camel@siemens.com>
References: <20240304035527.1281859-1-Meng.Li@windriver.com>
In-Reply-To: <20240304035527.1281859-1-Meng.Li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB6515:EE_
x-ms-office365-filtering-correlation-id: 8309da03-120e-4f83-ce1e-08dc3c34d6b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gwLwrET84hpmqdyKV72c8h+0B+Q2jSc2dtvDUQJ5vCkHu0XAQ5PFOUNWHRafNaWtz3ZZXkqD760+1O5J/Qi09ZV9dlkFsDWkEWnlpNJMykVy2TR+mKvN+FfklYLbC+q+2i0w3vINUSuI8Z+lXEb3fe37HmMjVa0jBUyrObyADM6chqeOjYL1Ba3+SLPdF4ss5ILd6WHy/vLrE0gPfrZjCrXmUl5Rdru8w/smisT4Zi5qTaf6xjBK+bOhI2OJj3fyMq2/W3+7If7S0XAQgmeIj63wgTJHarT8RjYz3szZ5Q26iRK9sqRQ/ZiSVJz86wF9nhZI1w6OjY39KzLIohTeLxE8IybsdSfg9PaHVNDgt/jpLjWVE7zsKrtLQnq8yrC5Y9ePElIXF8ccUozyEYevplnrG20TecsxOBAxRNwCU3XGUa9tCVZJ0ftRQLykMR7iyYKEOOcErLTCmN/KGdDTNVfenwWFI9pCG4mPyoDJBxRnxWMSKXejpA5HCkMhZ31sJHFqQYpwBQsth3NHO71dQAI8RmJUBymnDhpmtRJqou4GfIm29T07reV5qsVRPSCc6zJAViNIRjMnpXrHBRec5e4GI4pauMFBPG2RNVcQfZYNWah2+R3Wsckun6kp0xF9yqW9jdcl86jwY4fJ3zU4FkRi/5Xc0xsWFz9SAneZ9/I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZjRaRkhvUEt6ZEVDbCs5aU16TjN6eW9ueGpkMnZDUXFiUC9NUGdBMDBMZmQx?=
 =?utf-8?B?NVhtekhwQUttT3grM2NaN2xERGt2d0dmdjRrdjF1OFRCdERvWXU0cDhlbXd2?=
 =?utf-8?B?RmhMOEFlR0E4b0JaWXZMR3lVWDkxZGEwY1RGVWQ4QnprMGNpY2lqaXRlVFhT?=
 =?utf-8?B?YjZFcW44MSs2M0hMVlRyRUZkU2d3V3lzb2pJM2ZsWCtqQkhQdG96bUp6cFpu?=
 =?utf-8?B?V0Zub2VkYUxOL295ZC8wNkljQ2ZyUjBCakd3ZER0SFlqZGk4VlVFL053a3pt?=
 =?utf-8?B?OFZBSjhZQ0wzSGNDdWhvSE5hUFd5U3lTTGx2U3dVN0xjUU1aU2RRbWYvMm9o?=
 =?utf-8?B?bzBhMWduVFBuMUhtNi92VDdSRzJ6K2R4d0FVUVJrOU4rR1FxVmlwSzdFWmt0?=
 =?utf-8?B?ZUhFU3NVc1hNaHEyUG1GbDltRWRYbWQ5MGc5K0tQZ0xHODdhRExVdVpmWjlu?=
 =?utf-8?B?U0xQWDJpQVZhaW05a05lU2VRaHpvK0pjVGtDU1h3N0drQjZqdnV3TjFpUmpH?=
 =?utf-8?B?VHhuSldPZFV5c2NYSm9wYjdhSWkxYVpKSTFFaU14d1Z1NEpIY25VbGZIQ1lT?=
 =?utf-8?B?VVpYOTZTMnBSRitwSmpicnVmK2VEb0pWY1hYSUpsVVA2SUlOVGJDbDRtN2lV?=
 =?utf-8?B?MUprbTVsUWgyWDNRQnRQZU91ZkF0MFJpVktTczZZdi8yQkUzSVRYVkFMenFC?=
 =?utf-8?B?bEFuY0k0Y0VUYWR5cXpkVzVvZFFrN2l4MUIvZGVvOU1ybjAybTlraEx5dFps?=
 =?utf-8?B?SmNTeU5kc3NGaG4xUGJBV0VQQ1l5WTAzTnE3S1gvRGYwM0lvSVk2Y0ZtbTA5?=
 =?utf-8?B?SkFzU2NGUlpmTlRSSWJQMGc3Q1hkZjRVNytXeDVjMEE5VTl5MWVNYlZCMllU?=
 =?utf-8?B?TTBJUGppb3ZjWWZhVitEa1ZTbWNnWlpLenI5OXhWMTVTaGlGbE9XVTVYdnhK?=
 =?utf-8?B?WFowUmhrc2h5T3lmZHFSWFluMVIxaVU2bStaUkpwck16YkdvWDhweWRxTDZU?=
 =?utf-8?B?anJBQ1RRRWNQaEttMDUvc1VBWDZDQWNVdHlVRlgzVWdOblRQQ2tvK0gwdDAz?=
 =?utf-8?B?bHJSeU01S09iT3NsRzZ2MkVKb0V5cVRuTGtpaWN5Szl3c1RmdUlFb3F1b2Y5?=
 =?utf-8?B?bVR0WEFQZldxcmxPQ2JpUjJBK0cremJ1VmJlWTEveCs5cklzOXNmd1hVZGZt?=
 =?utf-8?B?cWNOQWp1cUlRZFYvczM5OTNzMktwTHBQVnJOeWk1L3NsS2RJelU4RzZPZjJ0?=
 =?utf-8?B?L3QzRElWLzdTeWVqR2RENkNnUW5ieFFsTkxhWlhZdTgvS1l5bkpmTVp4VFdJ?=
 =?utf-8?B?R21zdlN3dEtUUEI5RTZXNTQ5Wk1YWEdjczRmUmZaRCtBbHhGd2pUTnVrVkF3?=
 =?utf-8?B?WVh1TlVvVTBEV1hKbXdCaHY1czNGRkZKNVprMXdaazEvSkl3c0t6dmtQNHM4?=
 =?utf-8?B?ZGtXTy9mRGRDdS80TEpWUUYzclRjeE42bFNHbS80NXZ0MVBMVzV5djFLNDFL?=
 =?utf-8?B?YkJiTnpKSDBaNzlYS1J2bVdDTFlQSTVxS04rTUhYTVZqMis3WHJzUmFVRzNn?=
 =?utf-8?B?bWJzbmhGQzk0NHFhckVoLzJEbDVsWmxPQnNrdUtRVmRKV0RaWHJUUTRvTXRF?=
 =?utf-8?B?eFg1ZGFETHU1RXZ5T2NWRXNkR2F3SEh5V3A0NlYyeXJWS2Zhd1Y0TENtTmhu?=
 =?utf-8?B?ZnRLTUlEWmpoVU15c3M3b25rek5KbmNCTEZyR2hFQVJBak9SK1RHUlY0OWtR?=
 =?utf-8?B?Y0V5QWZxdU9seWJnYkJxanhKMVZEMUh4MWJIK1Z4NFBBZFBLT3d1V2hDMFVj?=
 =?utf-8?B?NnFnYU42WDI5YzEvWmR2NlYxeE5Nb0pZRUw0MHVmZWVMUndOK1NVeVRtTkhs?=
 =?utf-8?B?SGNnQU96eUVxUmNGU296MDdSSmZEcFFYc2lqbHZPYnRjbWxLODRLWUkvVUFs?=
 =?utf-8?B?UEhoTFo4RUhSREcvT2daakQrb1lyTGNyeVQyU3pHM2F2aWt2Y3ZiODNrVWVS?=
 =?utf-8?B?VCsybWtsYnkrMmF1cUlKOTI1L2FEcm00ZDBMa0o3VUlKcCtSdmlHdC8wMkRs?=
 =?utf-8?B?NklHYlRXZWVMcHR6U003UzJmblRBb1lqRDdDcTVYeVRCcS94MjlsYXhJNEtY?=
 =?utf-8?B?UjdhTW91cUQ5VjBQWWdvbk9vY2cyNGxDSXJESjMyOGh0WmhZMmZwRUlnOTBo?=
 =?utf-8?B?WWZjL2Y2SEx6UVB6bnVyMllXSVRIUEFhbk9PK2FSYXVRUkFUaFM5aHR2L0Ey?=
 =?utf-8?Q?A4Afr2LKZtDnzGT7U4sFUmTINxzQCIDeZr/MyqTuHE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF2810BC95BAD24DBDCA6800E049315C@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8309da03-120e-4f83-ce1e-08dc3c34d6b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 10:21:21.7727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9BBtPBj9mRTKCyy7t8rDMJrgl1J57U9UgXZ5DxmAb/rdI7c9/gyJ2RzrFb3a05227aXARz8+bqIxkUhA6to8tA34GgKjAYZImCLGgOMGI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6515
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 10:21:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5406

SGVsbG8gTWVuZyENCg0KT24gTW9uLCAyMDI0LTAzLTA0IGF0IDExOjU1ICswODAwLCBNZW5nIExp
IHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0KPiBJbiBvcHRlZS1jbGllbnQgcGFj
a2FnZSwgdGhlIENGR19URUVfUExVR0lOX0xPQURfUEFUSCBpcyBzZXQgYXMNCj4gL3Vzci9saWIv
dGVlLXN1cHBsaWNhbnQvcGx1Z2lucy8uIEJ1dCB3aGVuIG11bHRpbGliIGlzIGVuYWJsZWQgaW4g
eW9jdG8sDQo+IHRoZSAke2xpYmRpcn0gaXMgL3Vzci9saWI2NCwgdGhlIG9wdGVlLWV4YW1wbGVz
IGFuZCBvcHRlZS10ZXN0IHBhY2thZ2UNCj4gd2lsbCBpbnN0YWxsIHRoZSBwbHVnaW5zIGludG8g
dXNyL2xpYjY0LiBUaGlzIHdpbGwgY2F1c2UgdGhhdCBvcHRlZSBmZWF0dXJlDQo+IGRvZXNuJ3Qg
d29yayB3aGVuIGl0IGNhbid0IGZpbmQgb3V0IHRoZSBuZWNlc3NhcnkgcGx1Z2luLiBTbywgc2V0
IHBhcmFtZXRlcg0KPiBDRkdfVEVFX1BMVUdJTl9MT0FEX1BBVEggYXMgJHtsaWJkaXJ9IHRvIHN1
cHBvcnQgZm9yIG11bHRpbGliIGFuZA0KPiBub24tbXVsdGlsaWIgZmVhdHVyZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE1lbmcgTGkgPE1lbmcuTGlAd2luZHJpdmVyLmNvbT4NCg0KTEdUTSwNClJl
dmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5z
LmNvbT4NCg0KPiAtLS0NCj4gwqBtZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVl
LWNsaWVudC5pbmMgfCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNs
aWVudC5pbmMgYi9tZXRhLWFybS9yZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudC5p
bmMNCj4gaW5kZXggM2I5OTQzY2MuLmVmMDMwNDVjIDEwMDY0NA0KPiAtLS0gYS9tZXRhLWFybS9y
ZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLWNsaWVudC5pbmMNCj4gKysrIGIvbWV0YS1hcm0v
cmVjaXBlcy1zZWN1cml0eS9vcHRlZS9vcHRlZS1jbGllbnQuaW5jDQo+IEBAIC0yMCw2ICsyMCw3
IEBAIFMgPSAiJHtXT1JLRElSfS9naXQiDQo+IMKgRVhUUkFfT0VDTUFLRSA9ICIgXA0KPiDCoMKg
wqDCoCAtREJVSUxEX1NIQVJFRF9MSUJTPU9OIFwNCj4gwqDCoMKgwqAgLURDRkdfVEVFX0ZTX1BB
UkVOVF9QQVRIPScke2xvY2Fsc3RhdGVkaXJ9L2xpYi90ZWUnIFwNCj4gK8KgwqDCoCAtRENGR19U
RUVfUExVR0lOX0xPQURfUEFUSD0nJHtsaWJkaXJ9L3RlZS1zdXBwbGljYW50L3BsdWdpbnMvJyBc
DQo+IMKgIg0KPiDCoEVYVFJBX09FQ01BS0U6YXBwZW5kOnRvb2xjaGFpbi1jbGFuZyA9ICIgLURD
RkdfV0VSUk9SPTAiDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cu
c2llbWVucy5jb20NCg==

