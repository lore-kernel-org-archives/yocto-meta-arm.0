Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.47])
 by mx.groups.io with SMTP id smtpd.web12.7502.1584604925396518755
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 01:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2bmRfuNH;
 spf=pass (domain: arm.com, ip: 40.107.21.47, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvWeBQR7otLJwXoDzxLou4A1PjAv0vTIMzw+ZHHJ//c=;
 b=2bmRfuNHUxJhS+QXaMlMu3xZQ5xCzRNdREh0+LMVSSg7n/NssBvdGLjzPCFbssZ6Xi3/WBH01FpWc30WMnyHixcYuejC9dL8dRAW62GYTW841pRDdfAwRSepfh7lQ7ovWEC+7QqgdaY4cLrZMyYk+Ooj1aPPUJYSm2xUMjjYlGM=
Received: from AM0PR06CA0038.eurprd06.prod.outlook.com (2603:10a6:208:aa::15)
 by VE1PR08MB4654.eurprd08.prod.outlook.com (2603:10a6:802:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Thu, 19 Mar
 2020 08:01:57 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::86) by AM0PR06CA0038.outlook.office365.com
 (2603:10a6:208:aa::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Thu, 19 Mar 2020 08:01:57 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Thu, 19 Mar 2020 08:01:56 +0000
Received: ("Tessian outbound 2fd788417c13:v48"); Thu, 19 Mar 2020 08:01:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d42996b1705c385
X-CR-MTA-TID: 64aa7808
Received: from ecbf8d913bf9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DCFA35B2-0296-4F67-9709-072D085962E5.1;
	Thu, 19 Mar 2020 08:01:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ecbf8d913bf9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Mar 2020 08:01:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcpJwFJF/opjRcMpUqjLMtWHPtA5tEeKwZLp196Wh+4flLbQUNOi2rJ4TPOl559ciZW6yF5XX+AjquBsucPjwBKnI32D6wI+mwqXwR8o/wg9ojw+HEnKRLpcY7/ElaDxeq/3/ijNojMi65BO8a6Ry3wrTP9AaGwRZ3jzq/eVX/hQ9+B+P6/GGjZV1WUotUqsB+wy5dZ/TyWohT0fvf7nv7mQeVDMJcd77i17sS4ZpuvWOF7VrKExw8luaDDfJa5UCNPMQbCcKb9qmsVvyBzSzzPeZaXEUtEHbPNxlSZyJkcdGcIrX3fxiAlnFhW580u3U7eGB7So4FRlB74ysTGVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvWeBQR7otLJwXoDzxLou4A1PjAv0vTIMzw+ZHHJ//c=;
 b=GT2CVB97Ava2QWacM/zwl3FnFwqwxrUmnZorck/QZZPGsryjDND8Vn/NAe2O3sSK2qYmlvugM6liR7QnAl+rm+LIHMSUrSuomQOHFgy26a78QQNn/W5PIAriV8VMRr/7YAnNnRxaTISU+q+/I5/cb4okoixWehjf9bPS9Ct3T1NtQMo2OkmIAKfrEhdJtj9lItvuy9Qeb0bv5qo+Qrk8GMHYqx5lUCTvZm2vfxFAx+WDqyNeaLhnlzcXfSfeZ8eYrzlROjcsVRGeNFK6oWop9vRuC9b6jM2VuiCjWz93iNFMS4l9LwK5nEOtARQjrn/EEhW3Z2YuVBrATwZLJ0+Vjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvWeBQR7otLJwXoDzxLou4A1PjAv0vTIMzw+ZHHJ//c=;
 b=2bmRfuNHUxJhS+QXaMlMu3xZQ5xCzRNdREh0+LMVSSg7n/NssBvdGLjzPCFbssZ6Xi3/WBH01FpWc30WMnyHixcYuejC9dL8dRAW62GYTW841pRDdfAwRSepfh7lQ7ovWEC+7QqgdaY4cLrZMyYk+Ooj1aPPUJYSm2xUMjjYlGM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3274.eurprd08.prod.outlook.com (52.134.111.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Thu, 19 Mar 2020 08:01:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 08:01:49 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [PATCH v3] OpenCSD: Support for Arm CoreSight decode lib
Thread-Topic: [PATCH v3] OpenCSD: Support for Arm CoreSight decode lib
Thread-Index: AQHV/PWGAW9Sz2eGCE6B18W3ruTm0qhPj1wA
Date: Thu, 19 Mar 2020 08:01:49 +0000
Message-ID: <87CFF39E-1E6B-49FB-8897-2F452CC78904@arm.com>
References: <20200318071901.28503-1-leo.yan@linaro.org>
In-Reply-To: <20200318071901.28503-1-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 853886b6-af6c-47a9-2c15-08d7cbdbcb61
x-ms-traffictypediagnostic: DB7PR08MB3274:|VE1PR08MB4654:
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4654CC58C5F02D32B234225A9DF40@VE1PR08MB4654.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3826;
x-forefront-prvs: 0347410860
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(199004)(6512007)(54906003)(316002)(8936002)(86362001)(6506007)(6486002)(33656002)(53546011)(81166006)(81156014)(478600001)(8676002)(4326008)(66946007)(71200400001)(66446008)(186003)(66556008)(64756008)(36756003)(76116006)(66476007)(91956017)(2906002)(26005)(6916009)(2616005)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3274;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EqTuwJ8CQTP9k9T05HZpVpXJeowA+oF8dDfwRmoDtLKXn6pUQitCVtQBRNAldfeO1tshf9ssNqWB3pdciian7TTqF/RlAC+jACUfEXC1KDw4wfYZhlYkVnXArUROlq2dWS9zQmDPnFjspUEXGLz5h3AkhhpwBoV/Gg+yVO4QeVsBaZPwFbocJ719RRXp/0NwapR36/m9OZBVLZeS1r1Zlaplzd0sE0Nlx2ihykuPMLXqdW7L5RVWRPjYXmFbDK+JZkx4tA4tEURqdkjPYKgNBwKPdCHfeEVmB6ksqx9eDRZ+xLNsB9aHBKT4kaoBIeT+Wa1CqEvq2vlPsvFqbmuwT/B6CPyT7xC78PmTE9YyzwOSM38eqaO3XpqkE5Ty0EGzoo+eYuQC2gYgL2uuApDnqHRfOBJG/Hx+Pfiew5U4ys0ERrUid5fvjRvbfD9fAtmaJVRmapbYrkvbFbspEWPkwDvVpMpYKmAJMOOPSCTtnVqfkFtiabdZcdIe7c7L5hrH354q/Uut+FX2cOPSPwZ9fg==
x-ms-exchange-antispam-messagedata: 
 kuFufIqtwRvaluCh5DSkUvZTCaKgbcIBDyh/67JXBACWzFonspu8wyoYH9UCUSmyHSEYZFvUvR5CsLzJRZa63EuEkDOpL9bflO0eeWUmwRyz6IybMRkug3F7X+THY3EwIIptBSQwLt467LFtpL5mmw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3274
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(199004)(46966005)(86362001)(8936002)(2616005)(47076004)(81156014)(81166006)(316002)(6506007)(53546011)(36756003)(36906005)(8676002)(33964004)(186003)(5660300002)(26005)(2906002)(6862004)(4326008)(33656002)(26826003)(336012)(6486002)(54906003)(70206006)(356004)(45080400002)(478600001)(70586007)(6512007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB4654;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	acf841c9-9cc7-4d94-5e37-08d7cbdbc6e6
X-Forefront-PRVS: 0347410860
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z+IsCMkmJSlG67ICui2unlQoSoOdpkkd9299SIo5IB1ev9O+sbspVFFdNC4VWTd4/abYEDMY9s0gVpP4evZlLqome1p++56WHRPGTSEkRl7JLAtnmElKNj72hQlN8XudtQvjmQOSPhwoFXeh/1f8XcCQaRR0ya5sWkDbTn7enlIZHPVTQOt5JwpcfRZCTbCfL4Rvnpiyh5rqR9MzILZWEO4Y7jN0sNLmXCi04XEIJjg4H24seP/20GmHry9DqdoccmyzcDkd+i6BrtCCIr60JPIZ9Z1Z9B7b0yY8qDkyOPiwyDmofkP19RYElIL7u6O9UDWYptsA3C1LPhdV+7KXojUQHumhe/Pi3VypSc3Tu7gq9ydkbCP+ILk/1Y7CJCUhQgq9pxihdsgEE0U9Hevje1D1grHCJo2zTV/o9Iz5/cd0kHzR0yz9bMp/9K5MteWwtw20rltMT6WL0NN7JUBaXB5HQhVTIL0iu0Y4sWlOiFeBOvFUWErCWlfYTSUysNZsliQBbbg6g4lGpKdu0koRb94m6P7HJACtlRvlVh/nrRrCirceTUowlfKlUyAGfvPJMxMu4CpWArv8gNPdjkm/wg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 08:01:56.5172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853886b6-af6c-47a9-2c15-08d7cbdbcb61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4654
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_87CFF39E1E6B49FB88972F452CC78904armcom_"

--_000_87CFF39E1E6B49FB88972F452CC78904armcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDE4IE1hciAyMDIwLCBhdCAwNzoxOSwgTGVvIFlhbiA8bGVvLnlhbkBsaW5hcm8ub3Jn
PG1haWx0bzpsZW8ueWFuQGxpbmFyby5vcmc+PiB3cm90ZToNCg0KVGhpcyBwYXRjaCBpcyB0byBh
ZGQgcmVjaXBlIGZvciBPcGVuQ1NELCB3aGljaCBpcyBhbiBvcGVuIHNvdXJjZQ0KQ29yZVNpZ2h0
IHRyYWNlIGRlY29kZSBsaWJyYXJ5IGFuZCB1dGlsaXR5Lg0KDQpBbHNvIGNyZWF0ZSBhIG5ldyBm
b2xkZXIgcmVjaXBlcy1kZXZ0b29scyB1bmRlciBtZXRhLWFybSB0byBwbGFjZQ0KdGhpcyByZWNp
cGUuDQoNCnYzOiBBZGRlZCBzdXBwb3J0IG5hdGl2ZSBidWlsZGluZyAoQmVydHJhbmQgTWFycXVp
cykuDQoNCnYyOiBSZWZpbmVkIHJlY2lwZSB0byB1c2UgJy1DJyBtYWtlIG9wdGlvbiBzbyBjYW4g
Y2F0Y2ggbWFrZSBlcnJvcg0KICAgKEJlcnRyYW5kIE1hcnF1aXMpLg0KDQpTaWduZWQtb2ZmLWJ5
OiBMZW8gWWFuIDxsZW8ueWFuQGxpbmFyby5vcmc8bWFpbHRvOmxlby55YW5AbGluYXJvLm9yZz4+
DQotLS0NCi4uLi9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qvb3BlbmNzZF9naXQuYmIgICB8IDMx
ICsrKysrKysrKysrKysrKysrKysNCjEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQpj
cmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcm0vcmVjaXBlcy1kZXZ0b29scy9vcGVuY3NkL29wZW5j
c2RfZ2l0LmJiDQoNCmRpZmYgLS1naXQgYS9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5j
c2Qvb3BlbmNzZF9naXQuYmIgYi9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qvb3Bl
bmNzZF9naXQuYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi5mMWQ0Y2Fj
DQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qv
b3BlbmNzZF9naXQuYmINCkBAIC0wLDAgKzEsMzEgQEANCitTVU1NQVJZID0gIk9wZW5DU0QgLSBB
biBvcGVuIHNvdXJjZSBDb3JlU2lnaHQodG0pIFRyYWNlIERlY29kZSBsaWJyYXJ5Ig0KK0hPTUVQ
QUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9MaW5hcm8vT3BlbkNTRCINCitMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSINCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hZDhj
YjY4NWViMzI0ZDJmYTI1MzBiOTg1YTQzZjNlNSINCisNCitTUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vTGluYXJvL09wZW5DU0Q7cHJvdG9jb2w9aHR0cDticmFuY2g9bWFzdGVyIg0KK1NSQ1JF
ViA9ICIwM2MxOTQxMTc5NzFlNGFkMDU5OGRmMjkzOTU3NTdjZWQyZTZlOWJkIg0KKw0KK1MgPSAi
JHtXT1JLRElSfS9naXQiDQorDQorQ09NUEFUSUJMRV9IT1NUID0gIih4ODZfNjQuKnxhYXJjaDY0
LiopLWxpbnV4Ig0KKw0KK0VYVFJBX09FTUFLRSA9ICJBUkNIPScke1RBUkdFVF9BUkNIfScgXA0K
KyAgICAgICAgICAgICAgICBDUk9TU19DT01QSUxFPScke1RBUkdFVF9TWVN9LScgXA0KKyAgICAg
ICAgICAgICAgICBDQz0nJHtDQ30nIFwNCisgICAgICAgICAgICAgICAgQ1hYPScke0NYWH0nIFwN
CisgICAgICAgICAgICAgICAgTElCPScke0FSfScgXA0KKyAgICAgICAgICAgICAgICBMSU5LRVI9
JyR7Q1hYfScgXA0KKyAgICAgICAgICAgICAgICBMSU5VWDY0PTEgXA0KKyAgICAgICAgICAgICAg
ICBERUJVRz0xIFwNCisgICAgICAgICAgICAgICAgIg0KKw0KK2RvX2NvbXBpbGUoKSB7DQorICAg
IG9lX3J1bm1ha2UgLUMgJHtTfS9kZWNvZGVyL2J1aWxkL2xpbnV4ICR7RVhUUkFfT0VNQUtFfQ0K
K30NCisNCitkb19pbnN0YWxsKCkgew0KKyAgICBvZV9ydW5tYWtlIC1DICR7U30vZGVjb2Rlci9i
dWlsZC9saW51eCBQUkVGSVg9JHtEfS91c3IgaW5zdGFsbA0KK30NCisNCitCQkNMQVNTRVhURU5E
ID0gIm5hdGl2ZSINCuKAlA0KMi4xNy4xDQoNCg0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1
aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbTxtYWlsdG86YmVydHJhbmQubWFycXVpc0Bhcm0u
Y29tPj4NCg0KDQoNCg==

--_000_87CFF39E1E6B49FB88972F452CC78904armcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C0FFFF9D0E83C041828035A553EDE865@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDE4IE1hciAyMDIwLCBhdCAwNzoxOSwgTGVvIFlhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxlby55
YW5AbGluYXJvLm9yZyIgY2xhc3M9IiI+bGVvLnlhbkBsaW5hcm8ub3JnPC9hPiZndDsgd3JvdGU6
PC9kaXY+DQo8YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPg0KPGRpdiBjbGFz
cz0iIj4NCjxkaXYgY2xhc3M9IiI+VGhpcyBwYXRjaCBpcyB0byBhZGQgcmVjaXBlIGZvciBPcGVu
Q1NELCB3aGljaCBpcyBhbiBvcGVuIHNvdXJjZTxiciBjbGFzcz0iIj4NCkNvcmVTaWdodCB0cmFj
ZSBkZWNvZGUgbGlicmFyeSBhbmQgdXRpbGl0eS48YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+
DQpBbHNvIGNyZWF0ZSBhIG5ldyBmb2xkZXIgcmVjaXBlcy1kZXZ0b29scyB1bmRlciBtZXRhLWFy
bSB0byBwbGFjZTxiciBjbGFzcz0iIj4NCnRoaXMgcmVjaXBlLjxiciBjbGFzcz0iIj4NCjxiciBj
bGFzcz0iIj4NCnYzOiBBZGRlZCBzdXBwb3J0IG5hdGl2ZSBidWlsZGluZyAoQmVydHJhbmQgTWFy
cXVpcykuPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KdjI6IFJlZmluZWQgcmVjaXBlIHRv
IHVzZSAnLUMnIG1ha2Ugb3B0aW9uIHNvIGNhbiBjYXRjaCBtYWtlIGVycm9yPGJyIGNsYXNzPSIi
Pg0KJm5ic3A7Jm5ic3A7Jm5ic3A7KEJlcnRyYW5kIE1hcnF1aXMpLjxiciBjbGFzcz0iIj4NCjxi
ciBjbGFzcz0iIj4NClNpZ25lZC1vZmYtYnk6IExlbyBZYW4gJmx0OzxhIGhyZWY9Im1haWx0bzps
ZW8ueWFuQGxpbmFyby5vcmciIGNsYXNzPSIiPmxlby55YW5AbGluYXJvLm9yZzwvYT4mZ3Q7PGJy
IGNsYXNzPSIiPg0KLS0tPGJyIGNsYXNzPSIiPg0KLi4uL3JlY2lwZXMtZGV2dG9vbHMvb3BlbmNz
ZC9vcGVuY3NkX2dpdC5iYiAmbmJzcDsmbmJzcDt8IDMxICYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0
MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7JiM0MzsmIzQzOyYjNDM7
JiM0MzsmIzQzOyYjNDM7PGJyIGNsYXNzPSIiPg0KMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoJiM0MzspPGJyIGNsYXNzPSIiPg0KY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtYXJtL3JlY2lw
ZXMtZGV2dG9vbHMvb3BlbmNzZC9vcGVuY3NkX2dpdC5iYjxiciBjbGFzcz0iIj4NCjxiciBjbGFz
cz0iIj4NCmRpZmYgLS1naXQgYS9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qvb3Bl
bmNzZF9naXQuYmIgYi9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL29wZW5jc2Qvb3BlbmNzZF9n
aXQuYmI8YnIgY2xhc3M9IiI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxiciBjbGFzcz0iIj4NCmlu
ZGV4IDAwMDAwMDAuLmYxZDRjYWM8YnIgY2xhc3M9IiI+DQotLS0gL2Rldi9udWxsPGJyIGNsYXNz
PSIiPg0KJiM0MzsmIzQzOyYjNDM7IGIvbWV0YS1hcm0vcmVjaXBlcy1kZXZ0b29scy9vcGVuY3Nk
L29wZW5jc2RfZ2l0LmJiPGJyIGNsYXNzPSIiPg0KQEAgLTAsMCAmIzQzOzEsMzEgQEA8YnIgY2xh
c3M9IiI+DQomIzQzO1NVTU1BUlkgPSAmcXVvdDtPcGVuQ1NEIC0gQW4gb3BlbiBzb3VyY2UgQ29y
ZVNpZ2h0KHRtKSBUcmFjZSBEZWNvZGUgbGlicmFyeSZxdW90OzxiciBjbGFzcz0iIj4NCiYjNDM7
SE9NRVBBR0UgPSAmcXVvdDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vTGluYXJvL09wZW5D
U0QiIGNsYXNzPSIiPmh0dHBzOi8vZ2l0aHViLmNvbS9MaW5hcm8vT3BlbkNTRDwvYT4mcXVvdDs8
YnIgY2xhc3M9IiI+DQomIzQzO0xJQ0VOU0UgPSAmcXVvdDtCU0QtMy1DbGF1c2UmcXVvdDs8YnIg
Y2xhc3M9IiI+DQomIzQzO0xJQ19GSUxFU19DSEtTVU0gPSAmcXVvdDs8YSBocmVmPSJmaWxlOi8v
TElDRU5TRTttZDU9YWQ4Y2I2ODVlYjMyNGQyZmEyNTMwYjk4NWE0M2YzZTUiIGNsYXNzPSIiPmZp
bGU6Ly9MSUNFTlNFO21kNT1hZDhjYjY4NWViMzI0ZDJmYTI1MzBiOTg1YTQzZjNlNTwvYT4mcXVv
dDs8YnIgY2xhc3M9IiI+DQomIzQzOzxiciBjbGFzcz0iIj4NCiYjNDM7U1JDX1VSSSA9ICZxdW90
OzxhIGhyZWY9ImdpdDovL2dpdGh1Yi5jb20vTGluYXJvL09wZW5DU0Q7cHJvdG9jb2w9aHR0cDti
cmFuY2g9bWFzdGVyIiBjbGFzcz0iIj5naXQ6Ly9naXRodWIuY29tL0xpbmFyby9PcGVuQ1NEO3By
b3RvY29sPWh0dHA7YnJhbmNoPW1hc3RlcjwvYT4mcXVvdDs8YnIgY2xhc3M9IiI+DQomIzQzO1NS
Q1JFViA9ICZxdW90OzAzYzE5NDExNzk3MWU0YWQwNTk4ZGYyOTM5NTc1N2NlZDJlNmU5YmQmcXVv
dDs8YnIgY2xhc3M9IiI+DQomIzQzOzxiciBjbGFzcz0iIj4NCiYjNDM7UyA9ICZxdW90OyR7V09S
S0RJUn0vZ2l0JnF1b3Q7PGJyIGNsYXNzPSIiPg0KJiM0Mzs8YnIgY2xhc3M9IiI+DQomIzQzO0NP
TVBBVElCTEVfSE9TVCA9ICZxdW90Oyh4ODZfNjQuKnxhYXJjaDY0LiopLWxpbnV4JnF1b3Q7PGJy
IGNsYXNzPSIiPg0KJiM0Mzs8YnIgY2xhc3M9IiI+DQomIzQzO0VYVFJBX09FTUFLRSA9ICZxdW90
O0FSQ0g9JyR7VEFSR0VUX0FSQ0h9JyBcPGJyIGNsYXNzPSIiPg0KJiM0MzsgJm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Q1JPU1NfQ09NUElMRT0nJHtUQVJHRVRfU1lTfS0nIFw8YnIg
Y2xhc3M9IiI+DQomIzQzOyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtDQz0nJHtD
Q30nIFw8YnIgY2xhc3M9IiI+DQomIzQzOyAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDtDWFg9JyR7Q1hYfScgXDxiciBjbGFzcz0iIj4NCiYjNDM7ICZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwO0xJQj0nJHtBUn0nIFw8YnIgY2xhc3M9IiI+DQomIzQzOyAmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtMSU5LRVI9JyR7Q1hYfScgXDxiciBjbGFzcz0iIj4NCiYj
NDM7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO0xJTlVYNjQ9MSBcPGJyIGNsYXNz
PSIiPg0KJiM0MzsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7REVCVUc9MSBcPGJy
IGNsYXNzPSIiPg0KJiM0MzsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7JnF1b3Q7
PGJyIGNsYXNzPSIiPg0KJiM0Mzs8YnIgY2xhc3M9IiI+DQomIzQzO2RvX2NvbXBpbGUoKSB7PGJy
IGNsYXNzPSIiPg0KJiM0MzsgJm5ic3A7Jm5ic3A7Jm5ic3A7b2VfcnVubWFrZSAtQyAke1N9L2Rl
Y29kZXIvYnVpbGQvbGludXggJHtFWFRSQV9PRU1BS0V9PGJyIGNsYXNzPSIiPg0KJiM0Mzt9PGJy
IGNsYXNzPSIiPg0KJiM0Mzs8YnIgY2xhc3M9IiI+DQomIzQzO2RvX2luc3RhbGwoKSB7PGJyIGNs
YXNzPSIiPg0KJiM0MzsgJm5ic3A7Jm5ic3A7Jm5ic3A7b2VfcnVubWFrZSAtQyAke1N9L2RlY29k
ZXIvYnVpbGQvbGludXggUFJFRklYPSR7RH0vdXNyIGluc3RhbGw8YnIgY2xhc3M9IiI+DQomIzQz
O308YnIgY2xhc3M9IiI+DQomIzQzOzxiciBjbGFzcz0iIj4NCiYjNDM7QkJDTEFTU0VYVEVORCA9
ICZxdW90O25hdGl2ZSZxdW90OzxiciBjbGFzcz0iIj4NCuKAlCZuYnNwOzwvZGl2Pg0KPC9kaXY+
DQo8L2Jsb2NrcXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0iIj4NCjxkaXYg
Y2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPjIuMTcuMTxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0i
Ij4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+
PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPlJldmlld2VkLWJ5OiBCZXJ0cmFu
ZCBNYXJxdWlzICZsdDs8YSBocmVmPSJtYWlsdG86YmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiBj
bGFzcz0iIj5iZXJ0cmFuZC5tYXJxdWlzQGFybS5jb208L2E+Jmd0OzwvZGl2Pg0KPGRpdiBjbGFz
cz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxiciBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+
PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_87CFF39E1E6B49FB88972F452CC78904armcom_--
