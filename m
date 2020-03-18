Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web12.9894.1584514341249967383
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 23:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Biz5d3mR;
 spf=pass (domain: arm.com, ip: 40.107.6.63, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FAhqX/PMLr33LKQDzc5Q7wGiBTNYsbD+9PGtw1SjdE=;
 b=Biz5d3mRyiCB1NjN2YGGHAjD15TwRh2wIRrRn/Lrp39B6gtC+BQPTka3jlCsfxDOkeGRpsKfTzx03/WuEXGG79n1bav4luDlnGQlUcCPrXAbUssknWTbwV2cxiVrVLJth7W87RxhTiqnZLiXvj7WBJx/rAM/zBEF1yUwv8sC4C0=
Received: from DB3PR0202CA0014.eurprd02.prod.outlook.com (2603:10a6:8:1::27)
 by AM6PR08MB3352.eurprd08.prod.outlook.com (2603:10a6:209:4c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19; Wed, 18 Mar
 2020 06:52:18 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::7c) by DB3PR0202CA0014.outlook.office365.com
 (2603:10a6:8:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Wed, 18 Mar 2020 06:52:18 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 18 Mar 2020 06:52:18 +0000
Received: ("Tessian outbound da94dc68d1bb:v42"); Wed, 18 Mar 2020 06:52:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cd4de4cff04e2ba
X-CR-MTA-TID: 64aa7808
Received: from ed8aefe385e2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 05B50FC7-9B96-48A7-A79B-084F331D39D5.1;
	Wed, 18 Mar 2020 06:52:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed8aefe385e2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Mar 2020 06:52:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUp91FOkBmEOi3TQDjWWWHFLNE+TsRTsDZVokEuIJkezP6DBdgrJKbkogwaT+PQugqcrChMnESsM3YUwybBn9dmIk0GxL78ImYUo0ZliwnqzCVPC+aRCSfHak20e0kVcHAZADhGnWI9kr3S5V2conHkilCWSBYHCy815m9WD0FB7oPfxU3US86w2DamQWpsn0X1r7lobfOFUmloCn8uP2G3dt534Atv4d1y3awSQeGN4S5TVtqE5Jt1F383gZaTYxEMWUYnbGuGd16tE2gSt2sXLPLJMnJ6LC1So+ryNNSgOADGbFDxs6VXa+jGc5W8FeKYam0KnS3ox5qHNT7WtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FAhqX/PMLr33LKQDzc5Q7wGiBTNYsbD+9PGtw1SjdE=;
 b=j9X+71AhuT/KFB2oQSs5hebSsIJaYNHgeVajOzXx1/zS3EINmZelvOyVj9x2XbXw9os7y9qfYLZz/QzapnRePl/uVKIiusSw8/raC+9cWkSInPUFAN5UQLf+z1dxObJQQkksQ5Mg8otlHlC2v6CtkQE0m0jQ/MgjIKN5qfoJOJza1eDFBDF5OOuIMvwW5Ru7oYficZSiFLbr99uSbObif0xgw9d4YMAkarBWugS2y9PMnWQ1SmvT3NI/7nA8RwT9Ztsz9866qjotRtPopGSbW4eOrXGT5D4qRjRTtMqYosWsOvP6gKMdq6+4iumXD0PsebjAZPQ+MlyBiyf+eImmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FAhqX/PMLr33LKQDzc5Q7wGiBTNYsbD+9PGtw1SjdE=;
 b=Biz5d3mRyiCB1NjN2YGGHAjD15TwRh2wIRrRn/Lrp39B6gtC+BQPTka3jlCsfxDOkeGRpsKfTzx03/WuEXGG79n1bav4luDlnGQlUcCPrXAbUssknWTbwV2cxiVrVLJth7W87RxhTiqnZLiXvj7WBJx/rAM/zBEF1yUwv8sC4C0=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (20.178.21.27) by
 AM0PR08MB4513.eurprd08.prod.outlook.com (20.179.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Wed, 18 Mar 2020 06:52:12 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::8ce3:fb62:d6dd:1e04]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::8ce3:fb62:d6dd:1e04%6]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 06:52:11 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [PATCH v2] OpenCSD: Support for Arm CoreSight decode lib
Thread-Topic: [PATCH v2] OpenCSD: Support for Arm CoreSight decode lib
Thread-Index: AQHV/N2pFXSOF918hkmw4tzMaRfAfqhN6cUA
Date: Wed, 18 Mar 2020 06:52:11 +0000
Message-ID: <E61973CF-73E0-478E-B71C-7D94F93999DE@arm.com>
References: <20200318042807.32785-1-leo.yan@linaro.org>
In-Reply-To: <20200318042807.32785-1-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4761c6e0-4995-42d0-fb71-08d7cb08e66e
x-ms-traffictypediagnostic: AM0PR08MB4513:|AM6PR08MB3352:
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3352E8A223961C82D4687D099DF70@AM6PR08MB3352.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 03468CBA43
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(316002)(6486002)(54906003)(6512007)(33656002)(71200400001)(86362001)(53546011)(6506007)(478600001)(8676002)(81156014)(6916009)(8936002)(36756003)(81166006)(2906002)(4326008)(76116006)(5660300002)(66946007)(91956017)(66446008)(64756008)(66556008)(66476007)(26005)(2616005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB4513;H:AM0PR08MB3682.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +y4ESjNqwPtIz6BMt41hFb2AvnZNw4if7LtEgiocK6vC5poEe/Q/GxuU9peBfVNC9H+pwRYcLPke+mJ5nL4JQoxLxTIstQlabYroeit8WtCP4PA2RwZQ+XdDVPxWR/FahqJNqMNvgY9kAKyqtPjwQTXJYS59Su4K4aYjRj0NTIc+5pE1I7at93TL4l7kOH0MLFoCkqy3t+f02UomAm101+2Owf4dSUa4J1E22rHy0lJB8w2eLkBMFl4fnB0B3ksRGRpBFiabsA1/+jDcDvSKWZIAaz0Pth9L8oIeaYZcWQ4Q+ctlPGsUHH94OtWmKAPYjwKgvnBxQx0Wqv0nleh7TK3KoY+G8/a1YvM6rA3CkwW2xmCURY52n+UktRUKywcYYZqhgf7g9uaNYAyTNaXlxbaIkIFUEfnGpeiGOuQChKv8Bfh7ciH8Wp/7KtIgg/uoRzBSQYHtRSpiAEMU/PF7a8/wL0tq+szXTfEGIYrJNPc91v/JRC/QXDTNxXlvTM7KEma4y7AEAZUvuGfYnVmd0A==
x-ms-exchange-antispam-messagedata: 
 Mn2NGu8sgUvk92yPYkXvBNs3GBJIY3/o19HOpznDscY0c73Bfq8zeT4OLvyl2SPnS/YsQJ6Zl8A3XgwL9JnD59c/0U/zFUcoVMNa+ymBJ84y9l78E+KwH4IFYI0YkdB/LjDoiSNvlVfSLtxHdAAZ1g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4513
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(199004)(46966005)(2906002)(6506007)(53546011)(2616005)(86362001)(356004)(336012)(6486002)(81156014)(33656002)(8936002)(36756003)(8676002)(70206006)(70586007)(54906003)(186003)(26005)(5660300002)(6512007)(478600001)(6862004)(316002)(47076004)(81166006)(26826003)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB3352;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	16d34248-5beb-43cc-1e5f-08d7cb08e2b4
X-Forefront-PRVS: 03468CBA43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JJTHjQUN51n32CFv8ByRRWScCMtx2eEbMbAmFMRGZFD2W905QSPgu+Hy/2qoX83go8n/O5M/B0hxoIKPZk2GUdBK9JMFnfrEoIeOwQZKqJdJAPTlugs2sWpBNQs4AooA7QDhSKN5tuLSH+K5VeVkqSsJK2QXlTPa5GArnZDbK/27dW/wRZgzAA91KARjosxsRoIgvlWHMvrL+uBZSgVYerQpNOnBtW/XU4EBSRB5mom/t9jol8CvBLs2Vlxhr2Vmqoy30RUJ9ucGpjgTBBDtpa7WCeRl7WAnR8jj1hYnbh3H/9LDcJUq7MUGfrJMCpIeRHeZ+IVG1ziyumLlq6UXyhtdapb4o9nW6UF9bXWMOoiu+f48RSGS0cjiHsnuHLPNzMjD8IDzpegMx0+xqF9SIja+M6vzQC+uXQzhJtCYbrTwBgJQkOU2DyzHxAHAVtvZlzMIK92LyIUCkngWna47nVMpkVhsRKimPBvk5pfSfVSSHw27mCZu0qoVoBXOGHSF/3zPw6SgblDDb7La88tM9IBzAV+8Jab1RkX4yDQEkpUX0EopH25mx+cZTsPBJUox4qdnrcW23GgnGJGuXwq9hw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 06:52:18.2374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4761c6e0-4995-42d0-fb71-08d7cb08e66e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3352
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACEA14E451AF9F44B6592E1AE79281A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCj4gT24gMTggTWFyIDIwMjAsIGF0IDA0OjI4LCBMZW8gWWFuIDxsZW8ueWFuQGxpbmFyby5v
cmc+IHdyb3RlOg0KPiANCj4gVGhpcyBwYXRjaCBpcyB0byBhZGQgcmVjaXBlIGZvciBPcGVuQ1NE
LCB3aGljaCBpcyBhbiBvcGVuIHNvdXJjZQ0KPiBDb3JlU2lnaHQgdHJhY2UgZGVjb2RlIGxpYnJh
cnkgYW5kIHV0aWxpdHkuDQo+IA0KPiBBbHNvIGNyZWF0ZSBhIG5ldyBmb2xkZXIgcmVjaXBlcy1k
ZXZ0b29scyB1bmRlciBtZXRhLWFybSB0byBwbGFjZQ0KPiB0aGlzIHJlY2lwZS4NCj4gDQo+IHYy
OiBSZWZpbmVkIHJlY2lwZSB0byB1c2UgJy1DJyBtYWtlIG9wdGlvbiBzbyBjYW4gY2F0Y2ggbWFr
ZSBlcnJvcg0KPiAgICAoQmVydHJhbmQgTWFycXVpcykuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBM
ZW8gWWFuIDxsZW8ueWFuQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAuLi4vcmVjaXBlcy1kZXZ0b29s
cy9vcGVuY3NkL29wZW5jc2RfZ2l0LmJiICAgfCAyOCArKysrKysrKysrKysrKysrKysrDQo+IDEg
ZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
LWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qvb3BlbmNzZF9naXQuYmINCj4gDQo+IGRpZmYg
LS1naXQgYS9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qvb3BlbmNzZF9naXQuYmIg
Yi9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qvb3BlbmNzZF9naXQuYmINCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uYWY5NjcyMw0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvb3BlbmNzZC9vcGVuY3NkX2dp
dC5iYg0KPiBAQCAtMCwwICsxLDI4IEBADQo+ICtTVU1NQVJZID0gIk9wZW5DU0QgLSBBbiBvcGVu
IHNvdXJjZSBDb3JlU2lnaHQodG0pIFRyYWNlIERlY29kZSBsaWJyYXJ5Ig0KPiArSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9naXRodWIuY29tL0xpbmFyby9PcGVuQ1NEIg0KPiArTElDRU5TRSA9ICJCU0Qt
My1DbGF1c2UiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hZDhj
YjY4NWViMzI0ZDJmYTI1MzBiOTg1YTQzZjNlNSINCj4gKw0KPiArU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRodWIuY29tL0xpbmFyby9PcGVuQ1NEO3Byb3RvY29sPWh0dHA7YnJhbmNoPW1hc3RlciINCj4g
K1NSQ1JFViA9ICIwM2MxOTQxMTc5NzFlNGFkMDU5OGRmMjkzOTU3NTdjZWQyZTZlOWJkIg0KPiAr
DQo+ICtTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiArDQo+ICtDT01QQVRJQkxFX0hPU1QgPSAiKHg4
Nl82NC4qfGFhcmNoNjQuKiktbGludXgiDQo+ICsNCj4gK0VYVFJBX09FTUFLRSA9ICJBUkNIPSck
e1RBUkdFVF9BUkNIfScgXA0KPiArICAgICAgICAgICAgICAgIENST1NTX0NPTVBJTEU9JyR7VEFS
R0VUX1NZU30tJyBcDQo+ICsgICAgICAgICAgICAgICAgQ0M9JyR7Q0N9JyBcDQo+ICsgICAgICAg
ICAgICAgICAgQ1hYPScke0NYWH0nIFwNCj4gKyAgICAgICAgICAgICAgICBMSU5LRVI9JyR7Q1hY
fScgXA0KPiArICAgICAgICAgICAgICAgIExJTlVYNjQ9MSBcDQo+ICsgICAgICAgICAgICAgICAg
REVCVUc9MSBcDQo+ICsgICAgICAgICAgICAgICAgIg0KPiArDQo+ICtkb19jb21waWxlKCkgew0K
PiArICAgIG9lX3J1bm1ha2UgLUMgJHtTfS9kZWNvZGVyL2J1aWxkL2xpbnV4ICR7RVhUUkFfT0VN
QUtFfQ0KPiArfQ0KPiArDQo+ICtkb19pbnN0YWxsKCkgew0KPiArICAgIG9lX3J1bm1ha2UgLUMg
JHtTfS9kZWNvZGVyL2J1aWxkL2xpbnV4IFBSRUZJWD0ke0R9L3VzciBpbnN0YWxsDQo+ICt9DQo+
IOKAlCANCj4gMi4xNy4xDQo+IA0KDQpXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGhhdmUgdGhpcyBl
eHRlbmRpbmcgbmF0aXZlID8gVGhpcyBpcyBhIGRldmVsb3BtZW50IHRvb2wgc28gb25lIG1pZ2h0
IHdhbnQgdG8gdXNlIHRoaXMgb24gaGlzIGRldmVsb3BtZW50IGhvc3QgaW5zdGVhZCBvZiB0aGUg
dGFyZ2V0Lg0KDQpKdXN0IGFkZCB0aGUgZm9sbG93aW5nIHRvIHlvdXIgcmVjaXBlOg0KQkJDTEFT
U0VYVEVORCA9ICJuYXRpdmUiDQoNClRoaXMgd291bGQgYWxsb3cgdG8gYnVpbGQgdGhpcyBmb3Ig
dGhlIGRldiBob3N0IHVzaW5nIOKAnGJpdGJha2Ugb3BlbmNzZC1uYXRpdmUiDQoNClJlZ2FyZHMN
CkJlcnRyYW5kDQoNCg0KDQoNCg0KDQoNCg0K
