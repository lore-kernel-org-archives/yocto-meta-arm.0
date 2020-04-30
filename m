Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web12.7847.1588256550998586022
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 07:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qLAMA+eO;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvXCcmzSB7zS71M2lFJXFc3cVeW8NNpQWGGgmd5xjV0=;
 b=qLAMA+eOIzbBDDxu81NMWWQMO/4rXbU0xNKzHrXpi5rwDZhdEyJR4zWcj5zYIDIfuHwgbHwbVeR9JRHtvSuv8u6ZKMWdGV1FVUsRB3MECZbV4ODmanun+AbLSi1mTEtNJeaoUx1j09ROCbjwCDpgf3FG6EoMR27Owjc7REfyieg=
Received: from AM5PR0602CA0017.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::27) by AM0PR08MB4596.eurprd08.prod.outlook.com
 (2603:10a6:208:101::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 14:22:28 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::47) by AM5PR0602CA0017.outlook.office365.com
 (2603:10a6:203:a3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 14:22:28 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 14:22:27 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 30 Apr 2020 14:22:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0bb4935ee026a6c
X-CR-MTA-TID: 64aa7808
Received: from 4c24ab0e68f7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 22AD9080-C3BC-4EAA-8915-3D514DCA2806.1;
	Thu, 30 Apr 2020 14:22:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c24ab0e68f7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 14:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faDcFmmpP1m5vP5JPbx0lNPQKk4jUZlefJtDPzHHccZoU/3XRYWvsJ1Wrno9uWL9ehTQWEt8cp2uGoqFP1enAU4xakJFfkV1uW2xl0PJqsJuVnOHP8cfjYOdfH66VUcYwQnSNm1KObaoHSGuCLswjFidCX8zqXwqTJepBPJHm/U0iFO7KodFaemlU7X3sE2z8eCrW5vr3OLdP6zq4462sNPe+8qA3MXzaCJKRgxsYpeyDD3OCZ7WtPZGHHIbGPDULlRztjM7gkx431TPcmYVsUs1OPME75smc+sE81FW5nDlXtp7hiaNipiDv6rq9uJ85fBRiUG0Tn349vXTB0+Mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvXCcmzSB7zS71M2lFJXFc3cVeW8NNpQWGGgmd5xjV0=;
 b=DycoIZo8EdvVwBp9IYN7f+DmP3+zycBo/+ng3BibQz8r/owlXdD20vNI4iK19Rsa3LEM0UYNUhxG+WTl6i2n8ld9282eE8CEgqx++H0BNO/SNmQh+S3Pbdly/NIux1UB3HHshdj2bLqKv8dx7gYzslOQPrU435lOhiFiZwssf7E3PTt9QhzIflaxCQGbsuwvoWk1qnTYifnG+EdboHFRbzRU9/5YbxT6VZGTMfWBlWnLokKAYyi2PU2KnUQSJ2pcjaJenNULJqMXvk0KE8eQ8Teu4Vsyr3UQOMfEzi3HRXxpnwI2TEccVxeMOAIpTbNBbgAByOfqQyMLN3d24rpQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvXCcmzSB7zS71M2lFJXFc3cVeW8NNpQWGGgmd5xjV0=;
 b=qLAMA+eOIzbBDDxu81NMWWQMO/4rXbU0xNKzHrXpi5rwDZhdEyJR4zWcj5zYIDIfuHwgbHwbVeR9JRHtvSuv8u6ZKMWdGV1FVUsRB3MECZbV4ODmanun+AbLSi1mTEtNJeaoUx1j09ROCbjwCDpgf3FG6EoMR27Owjc7REfyieg=
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 by VI1PR08MB3758.eurprd08.prod.outlook.com (2603:10a6:803:bd::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 14:22:20 +0000
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926]) by VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 14:22:20 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to fvps and juno
Thread-Topic: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to
 fvps and juno
Thread-Index: AQHWHsfLyHQ2qIITzUSG5G9Fw4Y+PKiRX8cAgABYLIA=
Date: Thu, 30 Apr 2020 14:22:20 +0000
Message-ID: <DE5203D4-E002-4858-9FE4-C28BFAF1DFEE@arm.com>
References: <20200430081700.548-1-vineeth.raveendran@arm.com>
 <866cdd55986bc7fb389efe17d872889df325372b.camel@linuxfoundation.org>
In-Reply-To: 
 <866cdd55986bc7fb389efe17d872889df325372b.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f95cce18-b910-4c3e-9bdb-08d7ed11e903
x-ms-traffictypediagnostic: VI1PR08MB3758:|AM0PR08MB4596:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB459620B250D338D8A27999519DAA0@AM0PR08MB4596.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0389EDA07F
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3693.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(71200400001)(4326008)(91956017)(76116006)(66946007)(66476007)(64756008)(66446008)(2616005)(8676002)(8936002)(966005)(66556008)(2906002)(478600001)(316002)(6486002)(86362001)(5660300002)(53546011)(6506007)(26005)(186003)(36756003)(33656002)(6512007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PB6Lv5yXITcw6Ych/b4VInEL2NWQuIBR6hIHfl5yV9a9z/9uKwCi2YC90157BsXkZhJNnc9QTRoWxZwN2auZE3Fk51kFbuCdA/HeLNPVCe2cVLIOyLxFt0A30IK0a3dm5uT8Ti3sU8v62k1F3Iy8kfML64l5P5gvkktUJmB9H3Bn6TcjMHUXM5aaUnmd6tOUIUNaeNnUVfeOwwp18rV4ZzZNylg1AhNo500AXtSHviujqU8sL8IhfAa5O1wIQuzR8IyVmfTdI4u2bex0FVG17Obn1O//UsKFP08XU5LCRHoLxp1PVZJI+wBVw70JTw9xUbZG9HdghffxltP/3jj9Qs37ypt1rcCGfxseLSeVsWxsl11r3BHN1fMgNf0J0N5rX3FjnAvtExYcsmny1kEMsgvbz2N5xUnJo2Aw7FD5x9l9P6GHuUz1aTr4GUES2OUXTLB9bKnAOiQRxGeSV4y+OJni3bQz2IliOx9mhs+L6yivf7Y/qZI3Hl6GCMOkKdn4nc3FnQkwDu6Iu/n6+0HLjQ==
x-ms-exchange-antispam-messagedata: 
 ymdQPmjLfQrlklu9NY+N9KmgbamjNZhAOTu598lGC+1hdSpwdCnk65WwWObIra/0L03VCsArqWF12p+FzUg8xCnLgi9vSjz1iTyDmGBbn9IySqFFZD/kncAH5fQQwCW3J4dmbqYJhEBgz3DvfZm4t+ezTCFvR3Anx0RqKcJ2OngEYGZByBm0sfRbL8rre19NwqmGcEHDprkLDsTSdVrNNpy4wQbseRWUlOE6RyqDwetX8E+II6qFtmvQupAPamTYiF5FqqW65mTP+dKMzEKSyu7HW52XBkgcEK7LNVhkFF+x703rAqyFXeGX6n7gVxJPH/57KYMYMult/2nS9hadJTEMao5+fnUt5Nk9PaJmb34Wo+Eza2IHF21JNqZ1lYdV8Ux62hB65tFPVcHKWlzey0V3T9pZ/EtWGpsWzlQDSaWl4kReWHwiz0FND0WEX6uB57L/ZQmKgbQQfy2R93e+I7N8tx+68rGz1uLLxEHhYuhQCCIPd/gXlaYCIP6CMTB6a6LxeKeTYD/Gfi8jvyLVVvhuyX+2dtoxnDATl6FUa8tnT//g9IXBLgQWMiUCFq/zgINng+LkKR5MIGiNHjqGtfEdlf9Jbrpj57cTpBAQey5Rr5Z9HdwUQbcA8dy4x1UqA+xv4cbjv4FnNJtKG9neE8lm/hjEMuhnjJdS7w5YZEcSv7e3NhzUxtAH7vOTcW/mDmrRt2/nyEPWduTbdADcZBBsFyN07VcuWIDGIbCd7jhz9sohTjKpMkRx3oVfnbonLSWuK7Q+YvnheDtzgExdTpdAxiERse/icnjmN4EM+QE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3758
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(82740400003)(81166007)(36906005)(316002)(70206006)(70586007)(5660300002)(6486002)(2906002)(33656002)(8676002)(8936002)(86362001)(6512007)(47076004)(478600001)(966005)(356005)(26005)(336012)(6506007)(2616005)(36756003)(4326008)(6916009)(82310400002)(186003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	84df392c-938b-4ff2-3ca2-08d7ed11e4e5
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dvRbTgHT9C3lIEmJdSqGHt8EYKKE+6aMgzr4OCrFA7WhpHt1VI8eXC6exrbZqPISdl6bjG3+XRy0Lgpr6dirjd5oRK/impGwIkE+A8IpEmDgsGybjLpbUPv3B0StsM8dJnlW55ipiU/kflq8po1NM8JcdtMWr7TUZYeslgSrF7LgMv6N0IVuu7nG1EggkT4qSjkjIiN9HHA+QzYkMgikq5Xf+XRPcl/c3JZi9eLk9IzCpiD6ZHJpSWOurXObBxL1WKPs4zzj2hkqmvERvtXFu85pdngyfUtzcvx56lS5GsdC8DdZsFNeMMAGg3WijtMGFOjb3EavfNjPb8VUg38iQ93gAUHOBKvcduZ/nS2tBhNH7+fAONeYxjCLZG2Ru4+hUWztxvr+O5YIg/91IvCk/m5SKyAxBPPrQGcr0henn+AU4uiCzQlXPJ+OsP35DOnZFRATGdtf8gCcdnVpUxwm7PaCEztsnrmX2JmAhirJ07KPa0VVVrYZwNvkJPdWLCK85qlX2pmfFmwMWQmgeo1poENwPWrU5HVcfRP4bSrkLHFRjXZEMDgjnEi/gaHO/XJ3T8RD9y65t6u4JBtQ4UPR4A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 14:22:27.4699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f95cce18-b910-4c3e-9bdb-08d7ed11e903
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4596
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <816312DB72C8BC48B7A8549076D7CC1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCj4gT24gMzAgQXByIDIwMjAsIGF0IDEwOjA2LCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9uLm9yZ0Bs
aXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMjAyMC0wNC0zMCBh
dCAwOToxNyArMDEwMCwgVmluZWV0aCBSYXZlZW5kcmFuIHdyb3RlOg0KPj4gTWFrZSBmb2xsb3dp
bmcgbWFjaGluZXMgY29tcGF0aWJsZSB3aXRoIGR1bmZlbGw6DQo+PiAgICAtIGZvdW5kYXRpb24t
YXJtdjgNCj4+ICAgIC0gZnZwLWJhc2UNCj4+ICAgIC0ganVubw0KPj4gDQo+PiBNYWpvciBjaGFu
Z2VzIGluY2x1ZGUgc3VwcG9ydGluZyBrZXJuZWwgdmVyc2lvbiA1LjQgYW5kIFUtQk9PVCB2ZXJz
aW9uIHYyMDIwDQo+PiANCj4+IENoYW5nZS1JZDogSWE1OWFjODc0ZGU0ZTRjNGVhMDJjN2E0Zjk3
NmUzOWE5YjY5OTZmNzUNCj4+IElzc3VlLUlkOiBTQ00tODMzDQo+PiBTaWduZWQtb2ZmLWJ5OiBW
aW5lZXRoIFJhdmVlbmRyYW4gPHZpbmVldGgucmF2ZWVuZHJhbkBhcm0uY29tPg0KPj4gLS0tDQo+
PiBtZXRhLWFybS1ic3AvY29uZi9sYXllci5jb25mICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MyArKysNCj4+IG1ldGEtYXJtLWJzcC9jb25mL21hY2hpbmUvZnZwLWNvbW1vbi9mdnAuaW5jICAg
ICAgICB8ICA2ICsrKystLQ0KPj4gLi4uL2ZpbGVzL2Z2cC1jb21tb24vdS1ib290X3ZleHByZXNz
X2Z2cC5wYXRjaCAgICAgIHwgMTMgKysrKysrKysrKysrKw0KPj4gLi4uL3JlY2lwZXMtYnNwL3Ut
Ym9vdC91LWJvb3RfMjAyMC4lLmJiYXBwZW5kICAgICAgIHwgMTEgKysrKysrKysrKysNCj4+IC4u
Li9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0b181LjQuYmJhcHBlbmQgICB8ICAzICsr
Kw0KPj4gNSBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtYXJtLWJzcC9yZWNpcGVzLWJzcC91LWJvb3QvZmls
ZXMvZnZwLWNvbW1vbi91LWJvb3RfdmV4cHJlc3NfZnZwLnBhdGNoDQo+PiBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS1hcm0tYnNwL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAyMC4lLmJiYXBw
ZW5kDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcm0tYnNwL3JlY2lwZXMta2VybmVsL2xp
bnV4L2xpbnV4LXlvY3RvXzUuNC5iYmFwcGVuZA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS1h
cm0tYnNwL2NvbmYvbGF5ZXIuY29uZiBiL21ldGEtYXJtLWJzcC9jb25mL2xheWVyLmNvbmYNCj4+
IGluZGV4IDFhNTRkZGMuLjUyNTcxOTUgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhLWFybS1ic3AvY29u
Zi9sYXllci5jb25mDQo+PiArKysgYi9tZXRhLWFybS1ic3AvY29uZi9sYXllci5jb25mDQo+PiBA
QCAtMTEsMyArMTEsNiBAQCBCQkZJTEVfUFJJT1JJVFlfbWV0YS1hcm0tYnNwID0gIjYiDQo+PiAN
Cj4+IExBWUVSREVQRU5EU19tZXRhLWFybS1ic3AgPSAiY29yZSBvcGVuZW1iZWRkZWQtbGF5ZXIg
bWV0YS1hcm0iDQo+PiBMQVlFUlNFUklFU19DT01QQVRfbWV0YS1hcm0tYnNwID0gIndhcnJpb3Ig
emV1cyBkdW5mZWxsIg0KPj4gKw0KPj4gKyMgUGxhY2UgaG9sZGVyIGZvciB5b2N0byB2ZXJzaW9u
IGNvbXBhdGliaWxpdHkNCj4+ICtPVkVSUklERVNfYXBwZW5kID0gIjoke0xBWUVSU0VSSUVTX0NP
UkVOQU1FU30iDQo+IA0KPiBHZW5lcmFsbHkgd2UndmUgYWR2aXNlZCBkaWZmZXJlbnQgYnJhbmNo
ZXMgdG8gbWFrZSBpdCBjbGVhciB0byBwZW9wbGUNCj4gd2hpY2ggbGF5ZXJzIGFyZSBjb21wYXRp
YmxlIHdpdGggd2hpY2ggcmVsZWFzZXMuIEkgYXBwcmVjaWF0ZSBpdHMNCj4gImVhc2llciIgdG8g
aGF2ZSBvbmUgbGF5ZXIgZml0cyBhbGwgdG8gbWFpbnRhaW4sIEknbSBsZXNzIHN1cmUgaXRzDQo+
IGNsZWFyIGZvciB1c2Vycy4NCg0KV2UgaGF2ZSBpbnRlcm5hbCBuZWVkcyB0byBrZWVwIHpldXMg
Y29tcGF0aWJpbGl0eSBhbmQgYXMgdGhlIGFtb3VudCBvZiBjb25mbGljdCBpcyByZWR1Y2VkIHdl
IGRlY2lkZWQgdG8ga2VlcCBkdW5mZWxsIGJyYW5jaCBjb21wYXRpYmxlIHdpdGggWmV1cy4NCkZy
b20gdGhlIGV4dGVybmFsIHVzZXIgcG9pbnQgb2YgdmlldyB0aGlzIHdpbGwgc3RpbGwgYmUgaW4g
ZHVuZmVsbCBicmFuY2ggYW5kIG9mZmljaWFsbHkgdG8gYmUgdXNlZCB3aXRoIGR1bmZlbGwsIHdl
IGRvbuKAmXQgcGxhbiB0byBtYWtlIGFueSDigJxwdWJsaWNpdHnigJ0gb2YgaXQuDQoNClpldXMg
Y29tcGF0aWJpbGl0eSB3aWxsIGJlIHJlbW92ZSBmcm9tIG1hc3RlciBvbmNlIHdlIHdpbGwgY3Jl
YXRlIHRoZSBEdW5mZWxsIGJyYW5jaCAoSm9uIE1hc29uIHNob3VsZCBnaXZlIG1vcmUgaW5mbyBv
biB0aGlzIHNob3J0bHkpLg0KDQo+IA0KPiBXaGlsc3QgSSBjYW4gc2VlIHdoeSB5b3Ugd2FudCB0
byBkbyBhZGQgdG8gb3ZlcnJpZGVzIGxpa2UgdGhpcywgSSdtIG5vdA0KPiBzdXJlIGl0cyBhIGdy
ZWF0IGlkZWEuIFRoaXMgd2lsbCBhZmZlY3QgZXZlcnkgbGF5ZXIgaW4gdGhlIGNvbWJpbmVkDQo+
IHN0YWNrLCBub3QganVzdCB5b3Vycy4gT1ZFUlJJREVTIGFyZSBmYWlybHkgZGFuZ2Vyb3VzIHRo
aW5ncyBhbmQgbmVlZA0KPiBjYXJlZnVsIG5hbWVzcGFjaW5nLiBPdXIgcmVsZWFzZSBuYW1lcyBh
cmUgZGVzaWduZWQgdG8gYmUgZGlzdGluY3RpdmUNCj4gYnV0IGFmdGVyIGJhZCBleHBlcmllbmNl
cyB3ZSBnZW5lcmFsbHkgcmVjb21tZW5kIGFkZGl0aW9uYWwgb3ZlcnJpZGVzDQo+IGJlIGNhcmVm
dWxseSBuYW1lc3BhY2VkLCBlLmcuICJjbGFzcy1YWFhYIiwgInBuLVhYWFgiIHNpbmNlIHdlIGtu
b3cNCj4gd2hhdCB3ZWlyZCBpc3N1ZXMgdGhlc2UgY2FuIGNhdXNlLg0KDQpJIGFncmVlIHdpdGgg
dGhhdCBhbmQgd2Ugd2lsbCBtb2RpZnkgdGhlIHBhdGNoIHRvIGdldCByaWQgb2YgdGhlIG92ZXJy
aWRlIGFuZCB1c2Ugc29tZXRoaW5nIGxpa2U6DQpSREVQRU5EU18ke1BOfSArPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ0xBWUVSU0VSSUVTX0NPUkVOQU1FUycsICd6ZXVzJywg4oCYemV1cy1zb2x1
dGlvbicsIOKAmGR1bmZlbGwtc29sdXRpb24nLCBkKX0iDQoNCj4gDQo+IEFueWhvdywgdGhlcmUg
aXMgYSBidWcgaGVyZSBzaW5jZSBMQVlFUlNFUklFU19DT1JFTkFNRVMgY2FuIGhhdmUNCj4gbXVs
dGlwbGUgdmFsdWVzLCB0aGUgY2x1ZSBiZWluZyB0aGUgcGx1cmFsIG5hbWUsIGUuZy4gaXQgZGlk
IGhlcmUgZm9yIGENCj4gd2hpbGU6DQo+IA0KPiBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
Y2dpdC5jZ2kvcG9reS9jb21taXQvbWV0YS9jb25mL2xheWVyLmNvbmY/aWQ9ODcwMmI3OWEzYjkw
YTA2NTI0MDk4ZThiMmExMGI2ZTZkMjg3MTY2YQ0KDQpUaGFua3MgZm9yIHRoZSBwb2ludGVyIDot
KQ0KVGhlIGJiLnV0aWxzLmNvbnRhaW5zIHNvbHV0aW9uIHNob3VsZCBhbHNvIHNvbHZlIHRoaXMg
Y2FzZSB0aGF0IHdlIGRpZCBub3Qgc2VlIGJlZm9yZS4NCg0KQ2hlZXJzLA0KQmVydHJhbmQNCg0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQoNCg==
