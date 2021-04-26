Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.53])
 by mx.groups.io with SMTP id smtpd.web12.8648.1619451538151799224
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 08:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=srfoG1WI;
 spf=pass (domain: arm.com, ip: 40.107.21.53, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbFxwVIU0G+L1vXmx47KxOP+zu1yfIzpi7NmDQE/1OE=;
 b=srfoG1WI1F6sK1e1wcAsbz3evrORvPkddoLNkowNhLbN7ibTz0DKjggGG4o2BB4cB7x1iS1J9nMlzoT21Ez5VyUnxRVGJVA0cq/VeFT//G4291Hp5oBnHmKsF0X1D5Npyfi9kk+01KH3cPyzd70r9jr3LMNpwQfNBJVZ7Qgs4Xc=
Received: from AM6P191CA0068.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::45)
 by PA4PR08MB6143.eurprd08.prod.outlook.com (2603:10a6:102:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 15:38:55 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::7) by AM6P191CA0068.outlook.office365.com
 (2603:10a6:209:7f::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Mon, 26 Apr 2021 15:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 15:38:55 +0000
Received: ("Tessian outbound 700fd1fc53d5:v90"); Mon, 26 Apr 2021 15:38:54 +0000
X-CR-MTA-TID: 64aa7808
Received: from e655b3137085.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AAA276CC-D09A-4B33-90DB-6A55EE69CBCD.1;
	Mon, 26 Apr 2021 15:38:48 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e655b3137085.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Apr 2021 15:38:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDXFLP2Ftmkw3Jt9ubnI4q/5uJEVZwtveQWWkkcp/iwTcan+845ubu/dtEqkhLE9lfwXJogwHzH6CVucqfsDfdICh2fOZgzPmfYjaNfP34oAiY3DDip090kJmk5uHGwhsTToAhOBvUmI77jY+z5EetPbHnsp8EuY+ZU4BbZXUsFTS989Rsj6y4K6B7VzD5UGJbzW1hI3Ra/k0r5dj5r545Qj876XQfY96cO/irff73ANpYDjaFbhq47zTwqXx9jU0Q5gdExDVSjeEe2g9AoF/beolbv0880SJpyWR4tN/NNzJ0aaKC1inywlq/4D4xVD0JitshpsY1pNmlLjnRGiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbFxwVIU0G+L1vXmx47KxOP+zu1yfIzpi7NmDQE/1OE=;
 b=XwBPG+Xc1zOiSE/rx01rsacun5KKZhIpD3lNr04QndhrkICfe0fYkNGecYC+PSSDwSb7YZa6QkOd2XpRB8/vdMjZAeW2Ko1KDPn1hKLOP9bgdYTKHw/TjU6LV5NnPBu/B1kJVbwaCtKNcUXwE65tHlnMFB4em4cTdxwLp4WunI2DjQC5s6KjmGmVmD22gFgTr+RAoNpb4/Ri2LJI7uvnPDriWu8G4/XGMg+w+cMddLADDhoRSgFs0r4os+g459advK9ZO5i54mbn02v084RAJBRmuokXIYwmSG1ogd/+w8U4Z3wve7o3qf/npP6oOT8WQ/Iszr6h66su+z2WM64STw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbFxwVIU0G+L1vXmx47KxOP+zu1yfIzpi7NmDQE/1OE=;
 b=srfoG1WI1F6sK1e1wcAsbz3evrORvPkddoLNkowNhLbN7ibTz0DKjggGG4o2BB4cB7x1iS1J9nMlzoT21Ez5VyUnxRVGJVA0cq/VeFT//G4291Hp5oBnHmKsF0X1D5Npyfi9kk+01KH3cPyzd70r9jr3LMNpwQfNBJVZ7Qgs4Xc=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6295.eurprd08.prod.outlook.com (2603:10a6:20b:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 15:38:47 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 15:38:47 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "peron.clem@gmail.com" <peron.clem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [RFC] gator: Add new package
Thread-Topic: [meta-arm] [PATCH] [RFC] gator: Add new package
Thread-Index: AQHXOe5cOmrWOSIgTku3T6WH95RH2KrG5GSQgAAEjICAAAXvQA==
Date: Mon, 26 Apr 2021 15:38:47 +0000
Message-ID: 
 <AM6PR08MB34616197C3C538B106F3EE0292429@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <167925D13277D687.1887@lists.yoctoproject.org>
 <CAJiuCccapfx2x4XSqnT4eUBw7B74u3e_O96-BE=NX1vcUuO=HA@mail.gmail.com>
 <AM6PR08MB3461990064C0A43E1F1FFB8692429@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CAJiuCcdq4MD7tuMcNzQv_XNbJ4frEd86ggVAqi3oivZNBWEWpA@mail.gmail.com>
In-Reply-To: 
 <CAJiuCcdq4MD7tuMcNzQv_XNbJ4frEd86ggVAqi3oivZNBWEWpA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: BFAB4EBE3D0BBB44AD09A490EB1B6ACB.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 35049902-0198-453e-4792-08d908c966a7
x-ms-traffictypediagnostic: AS8PR08MB6295:|PA4PR08MB6143:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB614355197E4A7B49C584B13092429@PA4PR08MB6143.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 akTHhARGqEV4He02bacNtG2xi/Fwktn9iFVaF+fJlXM0pdXZq9WtH4dtmsFumWgQc96/Eiop+ftfHY7UQ9eun5Kl85EbhWKrBpjGP/1kaQ9WzuNhvPGC2YwlrQ4FP6i1poojA0MRw1jSgio4sOUYf6Ou5kOMrsfA7YbJkqJacjzePWXt66/6Lejgo9hwwkfLaAgyBB61TSjQvFHRModUV4bpx4SLalG22sqYD5uN4Xu8Ga2UHxBilebOodYebNUUXvIQF9/f+Eth6Qiq1ekaQLbBypXh2mOH3DmCRpQFR9rF5OcpMqKPtSMfWZt96DCS7TY9x+YUl6lP8gDwOst0NCucFM6rf5acP6NxUhmMx6Nd2x49596HeGf16KckG+MNPLwrsqUIzvw2YnPeOY7DzpTB+kzEWYVZtZEA3TgJiA8KQCVrrCRSLzr9tXV0S0Hd2Ij8GhGGA+j40+zc9K7APfSLu1mOaX4sv9CiU/zDp4GfP1OatchR0tV0ThhPtMCMpVCdRIXfMBi4+kNar0Ll7rG6/+hOs2OvwHiN26+JOWgK4GMakwozfyjLnFGz0GV0Nxto9d3XQLNOWmKnAbOpzDj9bx5DdOCYmv6H9tvu1rifoPBzQI1vIdhIUip7W7650SeUshfZF0tR78m6LZv0gaK3NQ0KO/3eKEmu0wZhJqdORHaBjOJECakHix+1Zn/S
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(86362001)(26005)(122000001)(54906003)(2906002)(8936002)(8676002)(5660300002)(9686003)(7696005)(55016002)(4326008)(6916009)(316002)(71200400001)(186003)(38100700002)(83380400001)(6506007)(66946007)(66556008)(76116006)(64756008)(66446008)(966005)(66476007)(33656002)(478600001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?M3JSVjJpcUgzYm1UOVM3TGgwNk5lZGp4Zmd6ZHpzS3NpaEVTS25sTTNkVWlv?=
 =?utf-8?B?WUpvdDhESlpaYWYxYmZpaVlPNEVZMjArZDZhSkp4bnNSeU9CTGU0V096R09U?=
 =?utf-8?B?TENPSmpFRFFXck1Sc1hJeC85RWhxWCtHQXNXTFBEM2NpL2NnNzRVNlN0d20w?=
 =?utf-8?B?c251SFYwRHR3cjBPZlptV25RLzlJdkkxT2doUDB1SmptSUdlRjVIa0s1WlFM?=
 =?utf-8?B?MXpWemZNZFNXUHpCRWRFY25PZ0kzbi9DaDVwNnBzTThONlZTQjFudUxYOWFD?=
 =?utf-8?B?WmZ3eGdhdlFqb25oSmxpaTFZZllPVU1XMlpPcHAzR3FVQmRQSWg3VlVDMzFm?=
 =?utf-8?B?L0x1Y2cvRVhQUEo5WVM2OVBFNUtBS2VEMW92dEwxYzlVdGl4ckplN09IMjl4?=
 =?utf-8?B?TWtGRmRSeVZXYW5EaXNSdnBtcVZmWmNoV0d2djVZVVBkbUQ4WHN2d2FXQUxC?=
 =?utf-8?B?M2hKNjlQbDRxYWIwV0ZkaXo5KzdFbGhxcHNvcTB2eFZrTUd3eFFyVy9DWmF4?=
 =?utf-8?B?aU9LdXhMUFN0M1VZclp6SXI4NVpZQnVRcFZOMjBHc20zOGt0c0orbzhFbUxF?=
 =?utf-8?B?MUZiMHpZTGlNcDFWRnpKQ2ZZNml5SnEzSmpCNWdzYVZFaDEwUmRSTWNjOUtj?=
 =?utf-8?B?UmlXUzh0MWdhYWRuZ01DQm90VUJjem5qNFZrbkNFaE1aK3c0bUJBeGU1MlFZ?=
 =?utf-8?B?SjU4VDdVdm1ubDF2RUV2MUNsQjFoZ3ZKWFMzQWg4aHhFQnRsdWxhWFprWHZt?=
 =?utf-8?B?dlk4RE56UWFKU2d3U1Y2ZVhwWVpTdWZ0QlorZVhONktHQm5rVDVKMmFsRGs4?=
 =?utf-8?B?NlFSb1RCQThvTUYzUElXWW5pWmZmaGhzVVdkRGRtVlJhQUdvL2xlQnhyZFlO?=
 =?utf-8?B?VjhuSVRvQU5EamZ3NHZmamd2V1Z2ck1Zb0xMUHpoOHdBVWZaMUU1SVAyZXFy?=
 =?utf-8?B?Nyt2dzNZR2k3VEJBUmtzNU9UNlkvS3UwZFR5V0lKNUZkQTlYclpBbzUveDdQ?=
 =?utf-8?B?b2xXbFF1MUp6TVZIeHNtS0M0cUdkcWtPanB6UThJSmlkb2I0c1hGZGk3TjV0?=
 =?utf-8?B?NklqTU1qNC9IdDVtRTQ5NXI1RlM3MmJNTWhrdG1UdHhOODlWcGJ3alY5YUs5?=
 =?utf-8?B?Qk9TVm1acjVEMENMSWFSSWZoRGEvQTRERmRHanlraUZ0bDN5bTluUGFyRjZn?=
 =?utf-8?B?QVdqOHBhSkJHeFVsUVhnOFVxTXlLSDdmSExveVNSdzF2LzJEaE1GL012U3Rr?=
 =?utf-8?B?aThjei9XWVhWcFE4VHl6dFhVL09qMVhEMFo3V1NTQWQ0R296UUd5SVdBQXJa?=
 =?utf-8?B?TlBrQmlrbmc3Z2FoTm11YzF1WWgxUHg0KzViVFpVTlFNR2E3cDZVNHRuUnlE?=
 =?utf-8?B?MFpaU2JRZE1MMjhIbUJGTHFQdVV6Y1NqTGIwLy9sUVNrU21vRExTQkV6ekVx?=
 =?utf-8?B?U2NuZ0JUd2tZZm9tU1Brb1U1QnNDOTRlcTdtek8zNkFjMXhsb29BWDdKVk5H?=
 =?utf-8?B?T2xVdHJhZXA5cTNGMEIzbnBjZXM3UEdURWlNdFZFWDFwZTg2cWcrbmFTVFlM?=
 =?utf-8?B?NGNWUlAxdkJZN3pxTGt0SmtINDNlYmlBM0hTKzZWeU1aQlRNRzJ0dzl5WWpZ?=
 =?utf-8?B?R0JsaTNZYTU0SnByL1kwL3owZE1Jclg5dFJXdFZDRFBSV1FQUmtzSHRPTk9h?=
 =?utf-8?B?T1hZTG1qOGpXd2tEZWlIbUIyQjE1Z2ZEWmVIanJ2VFFJSlF6bnN4L0tuV3lD?=
 =?utf-8?Q?QleCk3qbswH3ba17KJTLgKMnymSgxk9ZN6P+xKF?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6295
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b083e585-e5f2-4962-e2cc-08d908c961cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cd/TpISpdr0rqEsD8Ff1ung56ODaCx3iRpNJhsUgmtoby73Hq9aXV02yiMLr8fgnRa228ttjQeFKE1k9W41Z+f6cA+fNRwsAUkCNWQquVYwIwhP6UyU1ckdQipM/jg71SdOD5Le9g5vaq+H/aJOjZ5NdvT3uz3YRjGJ18IuUuRSMFI+Bf9v+rjUrIhWBzsP6qjdNgUzw6d+JZ86iceMJzxuUV29u2S9kkasl5/eSHwE0aoUKKNLCI1Qhe9H/288cZpBzqypv8XKDWOMonOGvTjzTSatZymXEgf9Bg8hqF3S+N58nDAJRxFiEQLHT1AtKGe2aGmQS8dAPhWma+vmzKP4xk7aRcsg8WpUPU7pKuKEaw3m039JJw1OVF3JR9gBlm4DVmmYItQvYEXICFSTXNFIOdNA5RblGe+0CubTJjByqqS365saQ5Z5e1I7fjZ4Pk4tQvSU8cPjrLJTr9Zhz4ov+pCe3wuPmO5vBNOc/G3Sllv1fWxM5DKE17g2OIGLRfrOcMNMTTcPawTjDDOPbAZeySBO1zGlFiHcsOrdr9YOyCui5ZMR33inKCOgF+Ni7YBvyk7wRForSaI4jS4SPXPbVaUdtOaA087t8+G9KsNO9w91JyJ7lLxacy+JYOn6KsEcj1pmA1dsuUTKEluDWKgYcJTM8z2j0Ss782j87YwY6th3anjFLgiaKbakvma8UMKd7ummQdY/DPRFSWRkOKZfGvmNS5mzY8owhYmukzKxGkOyCIJdOJXN2G8yovn708WD9aSk+9SFj4j7ZEQN30g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(36840700001)(46966006)(5660300002)(36860700001)(8676002)(47076005)(6506007)(82740400003)(70586007)(70206006)(966005)(52536014)(34020700004)(86362001)(7696005)(82310400003)(2906002)(83380400001)(478600001)(33656002)(54906003)(55016002)(336012)(8936002)(81166007)(9686003)(186003)(26005)(356005)(316002)(4326008)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 15:38:55.1614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35049902-0198-453e-4792-08d908c966a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6143
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogbWV0YS1hcm1AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZyA8bWV0YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj5PbiBCZWhhbGYg
T2YgQ2zDqW1lbnQgUMOpcm9uIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+U2VudDogMjYg
QXByaWwgMjAyMSAxNjoxMQ0KPlRvOiBEaWVnbyBTdWVpcm8gPERpZWdvLlN1ZWlyb0Bhcm0uY29t
Pg0KPkNjOiBtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBuZCA8bmRAYXJtLmNvbT4N
Cj5TdWJqZWN0OiBSZTogW21ldGEtYXJtXSBbUEFUQ0hdIFtSRkNdIGdhdG9yOiBBZGQgbmV3IHBh
Y2thZ2UNCj4NCj5IaSBEaWVnbywNCj4NCj5PbiBNb24sIDI2IEFwciAyMDIxIGF0IDE3OjAxLCBE
aWVnbyBTdWVpcm8gPERpZWdvLlN1ZWlyb0Bhcm0uY29tPiB3cm90ZToNCj4+DQo+PiBIaSBDbGVt
ZW50LA0KPj4NCj4+IFRoYW5rcyBmb3Igc2VuZGluZyB0aGlzIHBhdGNoLg0KPj4NCj4+IFBsZWFz
ZSBmaW5kIG15IGNvbW1lbnRzIGlubGluZS4NCj4+DQo+PiBDaGVlcnMsDQo+PiAtLQ0KPj4gRGll
Z28gU3VlaXJvDQo+Pg0KPj4gPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+RnJvbTog
bWV0YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPj4gPjxtZXRhLWFybUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgQ2zDqW1lbnQgUMOpcm9uIHZpYQ0KPj4gPmxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNCj4+ID5TZW50OiAyNSBBcHJpbCAyMDIxIDE3OjE2DQo+PiA+VG86
IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+DQo+PiA+Q2M6IG1ldGEtYXJt
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4+ID5TdWJqZWN0OiBSZTogW21ldGEtYXJtXSBbUEFU
Q0hdIFtSRkNdIGdhdG9yOiBBZGQgbmV3IHBhY2thZ2UNCj4+ID4NCj4+ID5IaSwNCj4+ID4NCj4+
ID5PbiBTdW4sIDI1IEFwciAyMDIxIGF0IDE4OjEyLCBDbMOpbWVudCBQw6lyb24gdmlhDQo+PiA+
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cGVyb24uY2xlbT1nbWFpbC5jb21AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4NCj53cm90ZToNCj4+ID4+DQo+PiA+PiBUbyBjb21tdW5pY2F0ZSB3aXRoIHRo
ZSB0YXJnZXQgZGV2aWNlLCBTdHJlYW1saW5lIHJlcXVpcmVzIHRoZQ0KPj4gPj4gZ2F0b3IgZGFl
bW9uLCBnYXRvcmQsIHRvIGJlIHJ1bm5pbmcgb24gdGhlIGRldmljZS4NCj4+ID4+DQo+PiA+PiBT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPg0KPj4g
Pg0KPj4gPkFzIHN1Z2dlc3RlZCBvbiBtZXRhLW9wZW5lbWJlZGRlZCwgaSdtIHJlcG9zdGluZyB0
aGlzIHBhdGNoIGhlcmUuDQo+PiA+aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWRldmVsL3RvcGljLzgyMzMxMTM1DQo+PiA+DQo+PiA+PiAtLS0NCj4+ID4+ICAu
Li4vZ2F0b3IvMDAwMS1nYXRvci1kb24tdC1zdHJpcC1kZWJ1Zy5wYXRjaCAgfCAyNCArKysrKysr
KysrKysrKysrKysrDQo+PiA+PiAgLi4uL3JlY2lwZXMtZGV2dG9vbHMvZ2F0b3IvZ2F0b3JfNy41
LjAuYmIgICAgIHwgMjIgKysrKysrKysrKysrKysrKysNCj4+ID4+ICAyIGZpbGVzIGNoYW5nZWQs
IDQ2IGluc2VydGlvbnMoKykNCj4+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4+ID4+IG1ldGEt
YXJtL3JlY2lwZXMtZGV2dG9vbHMvZ2F0b3IvZ2F0b3IvMDAwMS1nYXRvci1kb24tdC1zdHJpcC1k
ZWJ1Zy4NCj4+ID4+IHBhdCBjaCAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+PiA+PiBtZXRhLWFybS9y
ZWNpcGVzLWRldnRvb2xzL2dhdG9yL2dhdG9yXzcuNS4wLmJiDQo+PiA+Pg0KPj4gPj4gZGlmZiAt
LWdpdA0KPj4gPj4gYS9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL2dhdG9yL2dhdG9yLzAwMDEt
Z2F0b3ItZG9uLXQtc3RyaXAtZGVidQ0KPj4gPj4gZy5wDQo+PiA+PiBhdGNoDQo+PiA+PiBiL21l
dGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvZ2F0b3IvZ2F0b3IvMDAwMS1nYXRvci1kb24tdC1zdHJp
cC1kZWJ1DQo+PiA+PiBnLnANCj4+ID4+IGF0Y2gNCj4+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+PiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjhlNTlmZmZhMWZjMg0KPj4gPj4gLS0tIC9kZXYv
bnVsbA0KPj4gPj4gKysrIGIvbWV0YS1hcm0vcmVjaXBlcy1kZXZ0b29scy9nYXRvci9nYXRvci8w
MDAxLWdhdG9yLWRvbi10LXN0cmlwLQ0KPj4gPj4gKysrIGRlYg0KPj4gPj4gKysrIHVnLnBhdGNo
DQo+PiA+PiBAQCAtMCwwICsxLDI0IEBADQo+PiA+PiArRnJvbSAzNzBlOWM5N2YxYmMwN2E2M2Fh
ODdlOTU0ODIzYzAwNjMwNThhYWQ3IE1vbiBTZXAgMTcNCj4+ID4wMDowMDowMA0KPj4gPj4gKzIw
MDENCj4+ID4+ICtGcm9tOiA9P1VURi04P3E/Q2w9QzM9QTltZW50PTIwUD1DMz1BOXJvbj89IDxj
cGVAb3V0c2lnaHQudGVjaD4NCj4+ID4+ICtEYXRlOiBGcmksIDE2IEFwciAyMDIxIDE1OjI3OjE2
ICswMjAwDQo+PiA+PiArU3ViamVjdDogW1BBVENIXSBnYXRvcjogZG9uJ3Qgc3RyaXAgZGVidWcN
Cj4+ID4+ICsNCj4+DQo+PiBVcHN0cmVhbS1TdGF0dXMgYW5kIFNpZ25lZC1vZmYtYnkgdGFncyBh
cmUgbWlzc2luZyBpbiB0aGlzIHBhdGNoLg0KPk9rLA0KPj4NCj4+ID4+ICstLS0NCj4+ID4+ICsg
ZGFlbW9uL01ha2VmaWxlIHwgMiAtLQ0KPj4gPj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlv
bnMoLSkNCj4+ID4+ICsNCj4+ID4+ICtkaWZmIC0tZ2l0IGEvZGFlbW9uL01ha2VmaWxlIGIvZGFl
bW9uL01ha2VmaWxlIGluZGV4DQo+PiA+PiArYmE1ZjI5Y2ZlYjEwLi42ODA3OTQ4MzEwZjkgMTAw
NjQ0DQo+PiA+PiArLS0tIGEvZGFlbW9uL01ha2VmaWxlDQo+PiA+PiArKysrIGIvZGFlbW9uL01h
a2VmaWxlDQo+PiA+PiArQEAgLTI2LDggKzI2LDYgQEAgaWZlcSAoJChzaGVsbCBleHByIGAkKENY
WCkgLWR1bXB2ZXJzaW9uIHwgY3V0DQo+PiA+PiArLWYxIC1kLmANCj4+ID5cPj0gNSksMSkNCj4+
ID4+ICsgICAgICAgQ1hYRkxBR1MgKz0gLWZuby1zaXplZC1kZWFsbG9jYXRpb24gIGVuZGlmDQo+
PiA+PiArDQo+PiA+PiArLSMgLXMgc3RyaXBzIHRoZSBiaW5hcnkgb2YgZGVidWcgaW5mbw0KPj4g
Pj4gKy1MREZMQUdTICAgICArPSAtcw0KPj4gPj4gKyBMRExJQlMgICAgICArPSAtbHJ0IC1sbSAt
cHRocmVhZA0KPj4gPj4gKyBUQVJHRVQgICAgICA6PSAkKE9CSl9ESVIpZ2F0b3JkDQo+PiA+PiAr
IEVTQ0FQRV9FWEUgIDo9ICQoT0JKX0RJUillc2NhcGUvZXNjYXBlDQo+PiA+PiArLS0NCj4+ID4+
ICsyLjI1LjENCj4+ID4+IGRpZmYgLS1naXQgYS9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL2dh
dG9yL2dhdG9yXzcuNS4wLmJiDQo+PiA+PiBiL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvZ2F0
b3IvZ2F0b3JfNy41LjAuYmINCj4+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiA+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjhlMTViMWNhNWZjNQ0KPj4gPj4gLS0tIC9kZXYvbnVsbA0KPj4gPj4g
KysrIGIvbWV0YS1hcm0vcmVjaXBlcy1kZXZ0b29scy9nYXRvci9nYXRvcl83LjUuMC5iYg0KPj4g
Pj4gQEAgLTAsMCArMSwyMiBAQA0KPj4gPj4gK1NVTU1BUlkgPSAiRFMtNSBTdHJlYW1pbmUgR2F0
b3IgZGFlbW9uIg0KPj4gPj4gK0RFU0NSSVBUSU9OID0gIlRhcmdldC1zaWRlIGRhZW1vbiBnYXRo
ZXJpbmcgZGF0YSBmb3IgQVJNDQo+PiA+PiArU3RyZWFtbGluZQ0KPj4gPlBlcmZvcm1hbmNlIEFu
YWx5emVyLiINCj4+ID4+ICsNCj4+ID4+ICtMSUNFTlNFID0gIkdQTC0yLjAtb25seSINCj4+ID4+
ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4+ID4iZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlm
NWZjZTQ0ODZhODBmZGFmNGE0MjYzIg0KPj4gPj4gK0xJQ0VOU0VfbGlic2Vuc29ycyA9ICJMR1BM
LTIuMS1vci1sYXRlciINCj4+ID4NCj4+ID5UaGUgZ2F0b3IgZ2l0aHViIHNwZWNpZmllcyB0aGF0
Og0KPj4gPg0KPj4gPi0gbGlic2Vuc29ycyBzb3VyY2UgY29kZSBpbiBkYWVtb24vbGlic2Vuc29y
cyBsaWNlbnNlZCB1bmRlcg0KPj4gPkxHUEwtMi4xLW9yLWxhdGVyDQo+PiA+LSBteG1sIHNvdXJj
ZSBjb2RlIGluIGRhZW1vbi9teG1sIGxpY2Vuc2VkIHVuZGVyIEFQQUNIRS0yLjAgV0lUSA0KPj4g
Pk1pbmktIFhNTC1leGNlcHRpb24NCj4+ID4tIHBlcmZfZXZlbnQuaCBmcm9tIExpbnV4IHVzZXJz
cGFjZSBrZXJuZWwgaGVhZGVycyBpbiBkYWVtb24vaw0KPj4gPmxpY2Vuc2VkIHVuZGVyIEdQTC0y
LjAtb25seSBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZQ0KPj4gPg0KPj4gPkknbSBub3Qgc3VyZSBo
b3cgdG8gcHJvcGVybHkgZGVzY3JpYmUgdGhhdCBpbiB0aGUgcmVjaXBlLg0KPj4gPg0KPj4gPlJl
Z2FyZHMsDQo+PiA+Q2xlbWVudA0KPj4gPg0KPj4gPg0KPj4gPj4gKw0KPj4gPj4gK1NSQ1JFViA9
ICI2MDg4ZDM1MzMxNDZkN2I3Yzk3MDBiOGUzOTYyOTIwNTMyNDBiMjVmIg0KPj4NCj4+IFRoZXJl
IGlzIGEgbW9yZSByZWNlbnQgdmVyc2lvbiAoNy42LjApIHJlbGVhc2VkIDEwIGRheXMgYWdvLiBD
YW4geW91DQo+PiBwbGVhc2Ugc2VuZCB0aGUgcmVjaXBlIGZvciB0aGlzIG5ld2VyIHZlcnNpb24g
aW5zdGVhZD8NCj4+DQo+PiBBbHNvLCBhcyBkb2N1bWVudGVkIGluIHRoZSBSRUFETUUubWQsIHRo
ZXJlIGFyZSBjb3VwbGUgb2Yga2VybmVsDQo+PiBjb25maWdzIHJlcXVpcmVkIGZvciBnYXRvci4g
Q2FuIHlvdSBtZW50aW9uIGluIHRoZSByZWNpcGUgdGhlIG5lZWQgb2YNCj4+IHRoZSBrZXJuZWwg
Y29uZmlncyBhbmQgcG9pbnQgdG8gdGhlIGh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tDQo+c29mdHdh
cmUvZ2F0b3Ija2VybmVsLWNvbmZpZ3VyYXRpb24gbGluaz8NCj4NCj5EbyB5b3Ugd2FudCB0byBh
ZGQgdGhpcyBpbiB0aGUgRGVzY3JpcHRpb24gcGFja2FnZSBvciBhIGNvbW1lbnQgaW4gdGhlIHJl
Y2lwZT8NCj4NCg0KVEJILCBJIGRvbid0IGhhdmUgYSBwcmVmZXJlbmNlIGZvciB0aGlzLg0KDQpD
aGVlcnMsDQpEaWVnbyBTdWVpcm8NCg0KPlRoYW5rcyBmb3IgeW91ciBmZWViYWNrcywNCj5DbGVt
ZW50DQo+DQo+Pg0KPj4NCj4+ID4+ICtTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vQVJNLQ0K
Pj4gPnNvZnR3YXJlL2dhdG9yLmdpdDtwcm90b2NvbD1odHRwO2JyYW5jaD1tYXN0ZXIgXA0KPj4g
Pj4gKyAgICAgICAgICBmaWxlOi8vMDAwMS1nYXRvci1kb24tdC1zdHJpcC1kZWJ1Zy5wYXRjaDtw
YXRjaGRpcj0uLiBcDQo+PiA+PiArICAgICAgICAgIg0KPj4gPj4gKw0KPj4gPj4gK1MgPSAiJHtX
T1JLRElSfS9naXQvZGFlbW9uIg0KPj4gPj4gKw0KPj4gPj4gK0VYVFJBX09FTUFLRSA9ICInQ0ZM
QUdTPSR7Q0ZMQUdTfSAke1RBUkdFVF9DQ19BUkNIfSAtDQo+PiA+RF9ERUZBVUxUX1NPVVJDRSAt
REVUQ0RJUj1cIiR7c3lzY29uZmRpcn1cIicgXA0KPj4gPj4gKyAgICAnTERGTEFHUz0ke0xERkxB
R1N9ICR7VEFSR0VUX0NDX0FSQ0h9Jw0KPj4gPidDUk9TU19DT01QSUxFPSR7VEFSR0VUX1BSRUZJ
WH0nIFwNCj4+ID4+ICsgICAgJ0NYWEZMQUdTPSR7Q1hYRkxBR1N9ICR7VEFSR0VUX0NDX0FSQ0h9
IC1mbm8tcnR0aScgQ0M9JyR7Q0N9Jw0KPj4gPkNYWD0nJHtDWFh9JyINCj4+ID4+ICsNCj4+ID4+
ICtkb19pbnN0YWxsKCkgew0KPj4gPj4gKyAgICAgICBpbnN0YWxsIC1kICR7RH0ke3NiaW5kaXJ9
DQo+PiA+PiArICAgICAgIGluc3RhbGwgLW0gMDc1NSAke1N9L2dhdG9yZCAke0R9JHtzYmluZGly
fS9nYXRvcmQgfQ0KPj4gPj4gLS0NCj4+ID4+IDIuMjUuMQ0KPj4gPj4NCj4+ID4+DQo+PiA+Pg0K
Pj4gPj4NCg==
