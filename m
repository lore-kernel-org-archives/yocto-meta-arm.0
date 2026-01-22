Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E77CD3EE97
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:05:21 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42133.1769101519996444981
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 09:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/u7iks+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/u7iks+;
 spf=pass (domain: arm.com, ip: 52.101.72.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nI29I4jDsIbSOpObJOclzBMaoJfbHrm+O/XPEK/nkIX0J24xtAFcM4YKVIzmh3xgCREu75pTs8wNnpLB+1dy6AyVGqiW/HQcHoKv7ZXVI1Eh5pDmkrgib1nLP3Jk0n1VkHBWX/Bm3xexWUFRuDr34de8Xg8+8ZrfQUf5BoiNF05Khj2Y+ZpFhPTOIZt/18dFezWddZlGmpaiTzvPJj7l+k/KX/cK+MwOvvrs/vGpgHEL0iGjJbufQpC3CII6DBeCKvzH3mhNT6ME3brihI980yZmXOIBng3YKyzEeGk63V/RSbrWV3SfKTmTDRz/bwTQT/DFzP0w1dmYy4qRrHEPIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYQWxLSw5OLLe9ZMkOt2W/L7j4RFbNI7S1PN0QSNA8g=;
 b=SC/zBPuOjiwdJxzpJLI/cwCQ+XCMqLnV0kqmJRExpblT+URNWnBQTCnb8ImDhW6/eL3A8tJI0Ls3BCphXnNoxOh+u76MQzoLzO4tQN5e90GGw6I518uh9UPR7x0TUPrvCMbrGiKFbFlX8VOm107vzDpYYL1oXCAiakdB4oM1MJ2wJLl2Q3pR1NAvy0dSAeIf1EcgdHKvhjrL2YiEWqtQ7qUR5YGUzSQSb5cH+wsdGzXcj6R5ZtLFc1VDClAi08HmFeKbG2sLXITIRKWG68IoydJZ1ifahyJmL5X3zJgTiv5m6B92JLtD05Rg16L/fm4k8ZkimzkayvQv8O4oe76p6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYQWxLSw5OLLe9ZMkOt2W/L7j4RFbNI7S1PN0QSNA8g=;
 b=B/u7iks+v95frPWsd36ITlIiBNqalW4DpawChrifVD/w9T+16FfvjQwv04DoonKjuuhFqzE0FcdRUU1OhG01uQ1WNivcyQbQfcMc6f3MbG1UtOo2jTZXbDkwmME2LtIwMieKPZXz5Fz/dBjwAhz8XZkfLl40yvy3cJfaTt8auDE=
Received: from CWXP123CA0019.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::31)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:05:12 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:401:73:cafe::1f) by CWXP123CA0019.outlook.office365.com
 (2603:10a6:401:73::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 22 Jan 2026 17:05:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkJUit8hZV9cspj+1pDKejPgf7Gr4XjcCMz7sQxb8qVBBshQfdRcSp1AJFCgdfKycOD7cJGC9q4+c9Gka2SitPbcFvmNREcSiGuEFi5BT2yWEDYf1QpZf8sLI3E6sTfqCva2VAoa90NTTym+7z4rqfVRt8wVvhhmXKfbD0YYj3OT+VTEQaTNz3RTL8h06QBTJwuRHPDNkrBIPJi9mNbPGL/W/+n+3Gfo90S2w0/ZAiqSdLsxBJlXLaZ4D8JCAs28LkLSOqqZUW9ObCL8mIHRft51ML7zRHgpaDK9/Ct0AIMgC1aS8Ekvpz/tdjV6EX+otMSTEuJt6Rt4J492SAGo/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYQWxLSw5OLLe9ZMkOt2W/L7j4RFbNI7S1PN0QSNA8g=;
 b=xcdGKPPONdTfKqUASgneDaRRkr3uyAErte5cS0KoNEqMdaMhYwH6VbQ8hKOIvPZb87lfWDoOE3mRBgk5aQwxKTMwNoE1iD3ZSGwsFTXXrs+Kn3YWM2Mwqo/fVjn072lIvDhyQx+3Al+Efd69C8PGnhYL07RcLadS1JaOG90R5POTBoyyzWFz3TtxCOa4kLDVSlrLj8Dqg4HehLDNOuZx6Zx0WsHsmC+YlYscVOJQwgmdHRL63JED6AN7hZcyrndgnoqH70/O0golqfnoJCBare7s7wpPyUU3neDaennx5wTSGdcx2w0UXZgjOYkKKmra68czzAZoprwpCh9GZqQidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYQWxLSw5OLLe9ZMkOt2W/L7j4RFbNI7S1PN0QSNA8g=;
 b=B/u7iks+v95frPWsd36ITlIiBNqalW4DpawChrifVD/w9T+16FfvjQwv04DoonKjuuhFqzE0FcdRUU1OhG01uQ1WNivcyQbQfcMc6f3MbG1UtOo2jTZXbDkwmME2LtIwMieKPZXz5Fz/dBjwAhz8XZkfLl40yvy3cJfaTt8auDE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10634.eurprd08.prod.outlook.com (2603:10a6:10:51c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:04:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 17:04:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>
CC: "nylon.chen@sifive.com" <nylon.chen@sifive.com>, "peter.lin@sifive.com"
	<peter.lin@sifive.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [yocto] [RFC] Moving OP-TEE support from meta-arm to oe-core
Thread-Topic: [yocto] [RFC] Moving OP-TEE support from meta-arm to oe-core
Thread-Index: AQHci4Il2XLgin+fXkeB5Tm8vwmdQ7Veay+A
Date: Thu, 22 Jan 2026 17:04:09 +0000
Message-ID: <6C7BC2F4-364D-41C1-87CB-755547FE281E@arm.com>
References: <92b1fbe3da82c19ed2ca7a617077f6055a74f7e3.camel@bootlin.com>
In-Reply-To: <92b1fbe3da82c19ed2ca7a617077f6055a74f7e3.camel@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10634:EE_|AMS0EPF0000019B:EE_|VI1PR08MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2bbb60-ce32-4996-9514-08de59d867a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cVdxYllIMDdKWlZUVjlwRnAyZTZaZ3hSV0ZHc01YbXN6VUZ0aGFBVEo1blgw?=
 =?utf-8?B?ODFCbGE4U2JTaVVnL0REZkJRZjdEUnd4UUxrOFpZUW10VFE1SFJRN1gzMURU?=
 =?utf-8?B?TUliSzhlUjJ5NlIwVWxNMElTUE5mYklzQy9RZFF0TWtRUk1hVm1aU3k4UWhP?=
 =?utf-8?B?bVNRSFlwczk4QXR5d3lLQ3JRWlZ3U20wVWljbzkzNGM3eFpmaFJPbHM2L0Rq?=
 =?utf-8?B?OW1qa3RuR3ZuNDRVUEZqT3liZ0ZTWk5OQjdhUGxQSjNKQy8xWTZBNVlrejVz?=
 =?utf-8?B?WmtuZ0RFKzJlOEppU0JNT3IzUUE1a0Vabm95ZXlaS0dXL3lIa25yS05aOW9S?=
 =?utf-8?B?blJwTHdlNmF5SmR1MjBXWEp6TitJbCt3Vy9CdjcrUEpMM0lYaS9OT1B0QU9H?=
 =?utf-8?B?MVZLeTA1dGZRTEtMVk5Ja09tSXdWaU8vSDNJWHhSeitKYXZEa2FnQ2tIKy8x?=
 =?utf-8?B?NHpCYWwzYXdIMWE5ZXY5YW9IdGZZRkcyUUxhZ2dNazdCUGJZZHd2M2Zhd0N1?=
 =?utf-8?B?MFJQZEl0aDVwYXE4WUptRHczcHN1dkJhNFVjKzR1Qnc5RVRuZEIwdEMzQ3B6?=
 =?utf-8?B?Yi93VlduTFFYZFNnUU5GNENKQm1zSUkvU0dnSDB6RFdrOHIvdkdXb2JvQ24y?=
 =?utf-8?B?cWo4L2RITXp4OUtWb2JKc2Vna0tROTQycnN0ZlhYYnMwYnZ3QjFYYkYzbThp?=
 =?utf-8?B?TXBkT001U0MwWmZYeGF6azREOGFGajNab3ZKTjU0VGMwRC8xYjkyQ2RGaTFZ?=
 =?utf-8?B?VVI3Q0RldGNWTEJMNmVFcTZoVXNWM1JTY3NQOHB1ZjRnOVFaSDcrYjYxSUJU?=
 =?utf-8?B?YmpUTWVTdGE2dEhkK1N3TUMyd3ZWa0tpTzVXeGQwNU1ORHhZMjdoSG14Nytu?=
 =?utf-8?B?OTBnUlRZQnFqOWFDSWxpSDFBV2Joejk2bE41L3pOM1ZuWDdGYjZoNkNqTktT?=
 =?utf-8?B?dExvd1ZWekNqUGVLRXhyV21hOU9jUGNtREhRenFGeUxFVExwYVBQVHB2R0Z3?=
 =?utf-8?B?blI1Tk1nYVhKZlJnRTRkSm0wQWlxSG02cWxXNTlyZUllZVozTy84VkkrUjlY?=
 =?utf-8?B?aFFxMjMzUVJoeTNpdmo4eEVmbmhVS0c4djMzY1RsZnRyUEFqNDlNUmNqOE5Z?=
 =?utf-8?B?NjBBNzJrK0hXMHV6ekRVcTNCL1dFZ29mS1gySUpKU1VVVGViSk5UWmVvK29o?=
 =?utf-8?B?bUxCVlcwU094bFUraHVER2pJaHdONUh1eVl0M21kREtLcDJBUVhxOXp0SHRj?=
 =?utf-8?B?UDRZSWVRclUvdGU0OC84OEJjMWJBcU9OYWpTV253d01SRWhzdGIxUWoxR0tu?=
 =?utf-8?B?WUxZUk5CYThJRjAzSVdZNHB5YmJsMHF0Sld0Z1g3dVlBSkxlWFNoWm40Y0pO?=
 =?utf-8?B?dy9JSnhIZ0tWUkN4dllJaVZ6eW52SkZOdkJ0aUxySkgrTnRZY1NiVm9KYWdJ?=
 =?utf-8?B?NkppYjVWNEgzaEd6bkY0TXg3am4vbnI5SnhMOW5DUDltL1AzQnh6S01qQzV3?=
 =?utf-8?B?WW9BT3RWY0l4U3pXV24vRTM4M1JIanRaQ0JYMVdkeEJSMmtHK1Urb25zY3RG?=
 =?utf-8?B?WjZTR3NJaGIweHJUcGhZZEY1UXhFQkNQM0drT0VDaG5ZZWtHTEo3TFZWUHdu?=
 =?utf-8?B?cVpNN21WN2FVb1MyY09veW9DdEN0elcxOVZxZWdPU1NKT2pMVFEweVhORk91?=
 =?utf-8?B?UHUyeVlBNDlJck9xdE1uYTFGNHhHejMrVXg2MW8zTnUzSHdXbVEwZy9YeEp3?=
 =?utf-8?B?R2ZiVDdSL0NrNjRLMk5DYWs5YjA3cnlITXNTdE5KRmtSOHBBRUlLZjNQU2hi?=
 =?utf-8?B?SVVOQWIvSmlDV1pGMnBzYWxnQUVQbXVCNys0QnpaWktBVFliS2g1YTEzVDJt?=
 =?utf-8?B?ZGpMNGk3Uk9UUU5UdkgweTFkQjVHZGFTSUt0RnQwbHNDNDN0WThDcGhibFlJ?=
 =?utf-8?B?N1Ntd2RYSm9VU3VXWlJsdWRkOTU4VmZlTGdtSFZ2Mkt4RHZrczlUSUhHbUov?=
 =?utf-8?B?ZWxDS0J0NnMrRFNoLzVBQnRDVjZ6NFBtR0IyS1pVbGdyM0ZYY2NkU2dVM3Az?=
 =?utf-8?B?MldkbjdOU0R6UytIY2ZQVkl1b1VsOVZXMlhMRU9FRllsWkFEMU5YZEVYV3ZR?=
 =?utf-8?B?NGdHV2hnN0RWK2hOL3Q4RDVUUUNCNy9mRWNyUHhZSGd3U2dFUjdjM1Y4UlNo?=
 =?utf-8?Q?5XQu0LH47UOasXYMPao/2Ew=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E75BDE72C3CA294ABEEFC2C4F60F12D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10634
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc41e78c-c893-40bb-674b-08de59d842a1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|36860700013|1800799024|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGQ3UGZSUHgySFk3MWl3eDdTdUVRbURPai9odnZxeUxkYVR2MW5vVVAzZGtz?=
 =?utf-8?B?cFJhQ3pVNHVRelE5WXdKR0Jac3lZZUU2TktrbFQ2UWtvQmVVemJ0Qld0dE9s?=
 =?utf-8?B?dndFdE8xSGRMY1p6a2QySHhNZ00vQ2VOZGpRdklaVlNRdGtnSVVZdTNRdisr?=
 =?utf-8?B?M3pra21wTi96UEVuVWlSN0xWdFBBYTRlNVRRUHNTYUI0ZC9IWUdDN0h6QUFH?=
 =?utf-8?B?K21MNTZ2TTJQbUhzR0NoaVNYR3ZIeGtidFZGeFRNckpkZWlBR3MxTGV4QzlV?=
 =?utf-8?B?NlAvZXBKRDk2Ulp2VG0wejFjL2JBQ0VWRjJhUzhsOGpuYnM0aXFpWkVWR2Jv?=
 =?utf-8?B?UGRsbVRlUW5jek9GNFhrcGZTYVF4OU94V2lpVDB6NzRHZGM2enZvLzRUT08z?=
 =?utf-8?B?TlFEUE55QmxNZUM1ZGlVbGhUY3JBd0Q5OXlUZmVtYzkwcUhRSUJ1amZyODJu?=
 =?utf-8?B?MUU1Rm0wUUNFWGhyQk1TR3JCZWNRb3NCU0hNeVdPUVlmcjMxSVF0U2pjRmdj?=
 =?utf-8?B?cjJGWXpaM3ZFVURVL1pPN1lnRmpQeEtEaG5MdEZPSllYQ2QzdEZHVUJkcFY0?=
 =?utf-8?B?ODg4NTQ1R2JqemduYzlLQjllZHlwZjZLeTlrNVR2Y3U4VERMZlVsQlk4My9X?=
 =?utf-8?B?eXVCbWJ0eSsyYlNXMVgyMzljczdicXJ0d1JRTGVOL3ZnNnJFNUNMcVdmYUVG?=
 =?utf-8?B?cjMyTTF3dVZJRi8weGlGaWZ4RlAwdy9DM3gzak9MWFBZWTVrVGJKb09SYnor?=
 =?utf-8?B?U2twRWFZcmdEb3lncHYwbFYyQldncU1lYnVLcnB1NmZuTFVxMStRSlU3ZFNm?=
 =?utf-8?B?aHM1L01qdWxkM245U3ZiQ0IyWEs3SWd3QmdZS2k3dUw5bEtrZ3lpTmJVaVA0?=
 =?utf-8?B?N3BlUExJTWJPb3ZYUW9IOEMvQzFLMUxBTXJMa1RzOHJXa2tGQ1hjUzZZNFBE?=
 =?utf-8?B?Umk3YURibHNmQ2Q2c2hDeklpNXhFUnRlUmZkMkh2TEFXSUx0Q1hwVkNTbU1U?=
 =?utf-8?B?TkhsY09OWmxQWlNTZmVtdDBHRlRGU1crQWlxRHIvekhNSEtSMUpZaXgzdzJn?=
 =?utf-8?B?bGxQTXVnSkgvbHVIK09RZXRJczlCd0lGUitORE5JTGwvdDdoVTAwVFl0V3ZX?=
 =?utf-8?B?U1JScmlqOGtOTXpZdkFpaDBoenBVOVRSRzQxaU03eUQ3UHRMSkp5VHRQd2Zz?=
 =?utf-8?B?STloZ0p6cnlVdFh2QklUWmh2OXk1TWFwRXRWYVVUQjhvTkk3R3FYcjJ4RlFS?=
 =?utf-8?B?RUxyQ2U3a1J5TFplVVRMQmEzYTRSNVl0Q3daUWdJd2lld0s5T0E4S244R3V0?=
 =?utf-8?B?NGVieHkzT1lyemJ6eGRLcFlSV3cyWVEvZ0pBTkVtUWlYRFlEdlk2NjE5NDUw?=
 =?utf-8?B?TmxtcStZSVNpQUE5c29mRW1ncTNGTWhZR04vNy9pUllpWHg3WVBVY0tZczIx?=
 =?utf-8?B?TkphczJTbEVmRTFHOVJmUVpTOEozSHpkZlJObXdReTNWeTREZG5HSThwNlln?=
 =?utf-8?B?ZWIzS2ZDckJLMWRrbEczV0JXRTY1Y3NxalVrYnVEK1hDQkRjcWdPVG1mZ3pa?=
 =?utf-8?B?VUwyMzlsVmdnbXp3OEF4anBUTks4Tm1ER0hXa2szMmgvMHQ3elNpajNkMjFB?=
 =?utf-8?B?UHVKWUZ6MTI5aFVOVEQvNFF3TThHcHB4K0RJSndVNlZTQVAwZENQWGEySURw?=
 =?utf-8?B?MVBGcE10MjlxeFZhdzlubHNFRndOZHVaT3Zrak1WWXZ3eWRtWnRZdG1PMzRm?=
 =?utf-8?B?dXlzS1oyS0ovSnNORDZ6cWhHZm1IM3RuY0ZQS3dDUDVibWt4dzlFL3YrUXIz?=
 =?utf-8?B?NGYvcll0U1ZLQW9RS0FWTXhoTVovMUhPZEdDN1F4SThXYkNCUE9uTkRpRHFB?=
 =?utf-8?B?SEVtYlpscko2OUlFWFMrREhoUVRPRWI2OTE3YXZMcGpnMUUvNmJjS0F5MEdi?=
 =?utf-8?B?SjRmb0Z3ZEdvTXhsdi80TXFYdGZPZEc4c3psVzNwSC9iLzZQN0FiRXVjRThz?=
 =?utf-8?B?OWR0cGlmNFFoR0pWaVZpNENZTjZ0ZiszMXFKdVVwcS80TFZvSDFDYUhsbE5l?=
 =?utf-8?B?TS9ZWlJQaURIVTV1SFRwN2p0YXpTeS9DelZqVnZjZ2YyaUNkT0QzTkI4UHFU?=
 =?utf-8?B?L0pyVk9qbjRYajRKUHVxdUVWeHlvckdqQzl5MXlmMmtJcVpaLzN2ajUxRkxD?=
 =?utf-8?B?Lzcxb1pqOVRPY0JUM1N6S3dJbVdBUkFOWE9oWkhiUTFSZWRlYWV4eWUzSHg3?=
 =?utf-8?B?YkV0Mlo1eURNcDRkbUp1Y2hjbCtRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(1800799024)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:05:11.9281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2bbb60-ce32-4996-9514-08de59d867a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jan 2026 17:05:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6864

T24gMjIgSmFuIDIwMjYsIGF0IDA5OjMzLCBUaG9tYXMgUGVycm90IHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDx0aG9tYXMucGVycm90PWJvb3RsaW4uY29tQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBDdXJyZW50bHksIE9QLVRFRSBzdXBwb3J0IGlz
IG1haW50YWluZWQgaW4gdGhlIG1ldGEtYXJtIGxheWVyLiBIb3dldmVyLA0KPiBPUC1URUUgaXMg
bm93IGJlaW5nIGFkb3B0ZWQgYnkgbm9uLUFSTSBwbGF0Zm9ybXMgYXMgd2VsbCwgbm90YWJseSBS
SVNDLQ0KPiBWLg0KPiANCj4gR2l2ZW4gdGhpcyBicm9hZGVyIGFkb3B0aW9uLCB3b3VsZCBpdCBt
YWtlIHNlbnNlIHRvIG1vdmUgdGhlIE9QLVRFRQ0KPiByZWNpcGVzIGZyb20gbWV0YS1hcm0gdG8g
b2UtY29yZT8NCj4gDQo+IEknZCBsaWtlIHRvIGhlYXIgdGhlIGNvbW11bml0eSdzIHRob3VnaHRz
IG9uIHRoaXMuDQoNCkNvcHlpbmcgaW4gdGhlIG1ldGEtYXJtIGxpc3QuDQoNCk15IGltbWVkaWF0
ZSB0aG91Z2h0IG9uIHRoaXMgaXMg4oCcd291bGQgdGhlIHJpc2N2IG1hY2hpbmVzIGFjdHVhbGx5
IHVzZSB0aGUgc2FtZSByZWNpcGVz4oCdIG9yIGlzIHRoZXJlIGVub3VnaCBmb3JraW5nIGFuZCB2
ZW5kb3IgYnJhbmNoZXMgaGFwcGVuaW5nIHRoYXQgd2hpbHN0IGluIHRoZW9yeSBldmVyeW9uZSBp
cyB1c2luZyBPUC1URUUsIHRoZXnigJlyZSBub3QgYWxsIHVzaW5nIHRoZSBfc2FtZV8gb3B0ZWUu
DQoNCknigJltIG5vdCBhZ2FpbnN0IG1vdmluZyBnZW51aW5lbHkgc2hhcmVkIHJlY2lwZXMgc29t
ZXdoZXJlIGNvbW1vbiwgYnV0IEkgZG8gdGhpbmsgdmVyaWZ5aW5nIHRoaXMgd2lsbCBhY3R1YWxs
eSBoYXBwZW4gaXMgaW1wb3J0YW50Lg0KDQptZXRhLWFybSB0ZW5kcyB0byBoYXZlIHNldmVyYWwg
dmVyc2lvbnMgb2Ygb3B0ZWUgYXQgb25jZSBmb3IgZ29vZCByZWFzb27igKYgKGN1cnJlbnRseSBv
bmUsIGJ1dCBhYm91dCB0byBiZSB0d28pDQoNClJvc3M=

