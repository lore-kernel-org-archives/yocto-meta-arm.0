Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ABFC369A2
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:33:00 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.46])
 by mx.groups.io with SMTP id smtpd.web10.45037.1744025579694672562
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Apr 2025 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dKtjVldD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dKtjVldD;
 spf=pass (domain: arm.com, ip: 40.107.249.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DylEwFAP2gctesgLi/esm+uwqYoA+k1cIMFGN40a5EIeHlj97sSgXEEsEqMkDHMj893uDdTvkGQkef3iqhVz047AxBfOpFRtISUo8jU8SUDRsPeyD/AQ4h7FZd5mHJazTSNMAbTT28EeFuo+xzdxQLjQZlcdueBl2EIDZ2kgdkJCDUszSBr2GYOl816XgS29N1SieQgtBuN+tmO/opRVPGu/mnKLbbSsmFGHG3yPDuoFgIr0ykLuh+GpdTrHhjpTP8mITD1Ftg8arZbBylfS7no3+hRGk/q4dTqeji/ApCVBNxkLUSxSyvfW0xDHPSAmp1ZWirJVTLRGDK8HE7vMZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MpDb1o5X5YVy0+b3ZaX36aV2SMjlrbqse0Ti/2JAgQ=;
 b=QESMHu8toSMDy9legmix9QNmAl72KPkT9gmf5KyHNzQbpQa1BaNLsREp8DacXyGWJS9DnaMjSA/Rqr/yOo/4poxWKKzoZ76IDZhA1WvEkG21m8b+kkFpn2soEhkpOV7EtUBmr38E1NtN7psoBdtiUiz3Ho+UhOOy9QhDA+aE2Z4YOrlgsCphThRpvC+vlDYD/feMApqREZAZIHTAaW5Wj1yuuFMQAOkv54n9KarFqAxlZ0tjVigTuGh2l+ioSy0WxeSBqb5bhneccUkTkOh0o2K57/QAqimcJK9x/a6yccBnt2x3hUYbHnEBJrp0A7Wsrzl0+n1Ovpw7RDD5Xal6Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MpDb1o5X5YVy0+b3ZaX36aV2SMjlrbqse0Ti/2JAgQ=;
 b=dKtjVldDy9eldQkb08sQx8Cd2BgUagG27SrJWYFjy5ZzNOtyPDehPYRn6o5pS6nAyIMDJFxA3a5QbIreA3mpENqLj4K9fYNYj2Fi6ldbyk8fUqUdMvQsgTX5CHR1ipxyGf4xzyhQBBS8m7tWg26cv+Q1buC0poAXwNy1OniwkoI=
Received: from VI1PR0902CA0038.eurprd09.prod.outlook.com (2603:10a6:802:1::27)
 by GV1PR08MB8353.eurprd08.prod.outlook.com (2603:10a6:150:a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 11:32:52 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:802:1:cafe::fe) by VI1PR0902CA0038.outlook.office365.com
 (2603:10a6:802:1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Mon,
 7 Apr 2025 11:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.0 via
 Frontend Transport; Mon, 7 Apr 2025 11:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7yeSOCOvLTNY3ghoCOPJzbxUzq3pIr8sfQ3Xg9vDsGHn77ldqaGaLpCf2kPvl9J78yKx2bK/fcKzK4ocwlZYIdL+DLqH3Quz+sxObxd4ZJmXJkTcxcnWJwBs9TrDUg2qvKf3r5e0pweS1RZzEszZjTzFxFUGgEvEFpCWr0JUVKkr28fAA+TjaAWfL0ESrgNZki2VN22EVfZNLB/sat2ScoGaayDGsnmix1N+LOEQzpFuJbRRJ5uArPF9HV1TNHbdVDP+38vgk1BmwPCEyLsXrBVXcqzndSMtDq5bxG/h9NKASKgoKh+9Bzy8ChaK9RMfoeGe4iFzi4nF5IEP2UWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MpDb1o5X5YVy0+b3ZaX36aV2SMjlrbqse0Ti/2JAgQ=;
 b=Z/y5jjRPdCT7h5o6w6ivagYpUA3nzQ5ZPWi0O7xstN1G8x37DpYDmlKOpTZOCfCZu7XiTja+Wd5WPrk9b6FSKqHL3Vig/AVsbf0W2zZJsZU0iQNbrrOQSwEvmAlvWIBa4IdMQPPs4eqvaQJgXRXLL2Sg8dzwjdabT9QNzhfFqtx22u0CBKKjA1Sx/TMsYMJVJGhN9xkj4MWeuS0SEv2Cp/W4sG/RLf/p173JFSF8lE8UyA2Ods2JVZzOeiasvuHHj4xm7vLQFZsic0HZHionw+LM2gcZMZIRmPjiK7uif8zrfLeD77kINjPvF0BZRWZs/UY8eH4483CeqCpv5x1NcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MpDb1o5X5YVy0+b3ZaX36aV2SMjlrbqse0Ti/2JAgQ=;
 b=dKtjVldDy9eldQkb08sQx8Cd2BgUagG27SrJWYFjy5ZzNOtyPDehPYRn6o5pS6nAyIMDJFxA3a5QbIreA3mpENqLj4K9fYNYj2Fi6ldbyk8fUqUdMvQsgTX5CHR1ipxyGf4xzyhQBBS8m7tWg26cv+Q1buC0poAXwNy1OniwkoI=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DB9PR08MB7447.eurprd08.prod.outlook.com (2603:10a6:10:36d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 11:32:16 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 11:32:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Walnascar release plans
Thread-Topic: Walnascar release plans
Thread-Index: AQHbp7C3nPcaBuBsFU+Nq0YMTwCZ7Q==
Date: Mon, 7 Apr 2025 11:32:16 +0000
Message-ID: <653D479B-3DAA-4459-9C1A-D86F6A82725A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DB9PR08MB7447:EE_|AM4PEPF00025F9A:EE_|GV1PR08MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9bb4bc-5411-41ce-9401-08dd75c7ede7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cUZ3T2hCUUlmT3pkVk1RMlFZOHdORFdPMlA2WE1rb21QdDNueFhWeWl1Y0xD?=
 =?utf-8?B?RlpSNWZtWGM0NXR4SERTRmU4djlzY0UzL0YwMUVwYUp2MVEyc25JcTQxMXkr?=
 =?utf-8?B?bVFHWlZIcVlHRGMvVnBnd0wrLzVZT3h3WStpNkhad1dTQ3V0bWR3YjgrWFZv?=
 =?utf-8?B?cXMzOUUxTVZFdy96TkpLMGl6QzR5UEw3SVp5Z3JtQU5YZXErZG0xdzF0b1FH?=
 =?utf-8?B?N2FMRkZVSytsemtra2lkZHJ4UnR5emtzenBYd3hQd1dndm1YY3ZUWEQvQVB3?=
 =?utf-8?B?bk1zYUpna0N6ZzV4SDdRVW1HQ0dvNTZpcTRDWDVSR0Jrb1pXZWQzMmZQWU1i?=
 =?utf-8?B?YWhVVU1qdjBSRTRKWUdCcTFmQm9MYXJwWTFNU29RWXJvSGtodGxqU2I2YlZJ?=
 =?utf-8?B?WnVCSHpZZVlvK2cvbXFQblIyaDgrQVdzTTJzRFVHT0czeEltRkxsaVNBWTYr?=
 =?utf-8?B?Z3hLb0k1WTVtMnJuWnY4d1c1dTJ3N1ZEYm9EZ2JoQm9wZldYcmJVT29pKyt3?=
 =?utf-8?B?NVdpTGp0ZlV1YTk1NUQ3SlpTOXJwZmRBT3VCK0dLMmlkb1g3UXhXUXAveUhH?=
 =?utf-8?B?bE9MaUJVNndBNEdNeGpKRmRueGpXQUhlY1lnOHpHQ1RhSEhwUWpoM3dPMktB?=
 =?utf-8?B?TFpqNXpNMTZzdnUybFJFNTBkWkpjM0VMVUs2UzI1RFdOdGFydXVVL01GRE9Z?=
 =?utf-8?B?QlJNYUNCdy9HV2dKcnlYaVRkMkY5ZVZQaU9YOEs0TjRKbGRLSDVSYUg4emlU?=
 =?utf-8?B?OUhYbDYxZDBIWFovWE9pdWRaYlRWV09Vb1FGaHlLa3dVcS9oN3pXT3FsZjQw?=
 =?utf-8?B?TFNZMXl4VXY0ZUYrYWQyT3p6c3YxU0VIMjY2N0FCb25TMllhcTNXcjBjMExJ?=
 =?utf-8?B?d1llWkY3NUVXTmZCMzRrTU45WjBlT3NFL1NHSkkwdDNsRVNuNDFMMllDMGI3?=
 =?utf-8?B?UjNSc3Z1Z2Z2cld0a3hNQWJMalcwR1VkNk9RNnVOWFd5akU0S2ZHZDU2dlpN?=
 =?utf-8?B?cEpnNU52QmpZU1lldjRJZlJ3OERkbjg3NDZpY0tZaGxsSFhVQ3JQZmZINmdT?=
 =?utf-8?B?TzVQemZ4bHRPM09YamlzY0pUb0liR21nWGdUK2tFUUV0cFRZNnZqUTNTOHlK?=
 =?utf-8?B?Kzc4SjhpbjYrdE1tM2QrZmZXbUx3YTZ4UDJxU2FuaHB1cWIvOGJsb0puTStm?=
 =?utf-8?B?L2FxYmRsYUpMUDFsNERHREtsenpzVTRsdkFkbDRNdFBQL0Zmd3ZIVlVTc0I4?=
 =?utf-8?B?cHcxcDY3aDFPT2pnOXozazJKcEMzWDE2bkN0ZnRzOXEvZnJGVzNvTUpiNWEx?=
 =?utf-8?B?R3VobW12OXZqZm5yd1RhVE1ZY2hWYTdKa25qOTE0VUtQNzluNWxJSzNyNzF3?=
 =?utf-8?B?V1BmOEYwWUFadHN1dlp0aUN1Tys3eExZaGpaNE9YSklGTFJMbVBCK1p0ZzZD?=
 =?utf-8?B?M09tdzY2aERaTE1YTERYMmh3NktFWDUyK3NQTUFmTGVETkJQOWROc3dMa3Vh?=
 =?utf-8?B?NWx3NjBPWXFUSy92Mks1L2JIUzBlTnB1OVhMVTdmYlc4ejlZUTRDVnhtV3R0?=
 =?utf-8?B?alpsTUZNdWJxMTV5QUh1RExSTnVLckp3c0wyOE1qMzJSWWoySGtMcjRYSi9m?=
 =?utf-8?B?d3pIRnJaVUY3RURVUW1NRUdyM2x4RERrMDY4ekJwQnZkaDMyYWNEWDRQZU4y?=
 =?utf-8?B?Y0hUOXBsYVNHdXFyWDRSMzdidE5QOTZkdytkbGFTb3RjOGF1S0YrNVBLT015?=
 =?utf-8?B?QnNKSFNFNUFqUkxncEVIa3hFcWVWN29qdHYrTHlJUFovS0svSkRjWFNwMGd5?=
 =?utf-8?B?TjZEUXRHVUNTR1ZMY0RSN1J1S1JSVkNURE53OUlwUnFOZmFnSFBubzdKeVdT?=
 =?utf-8?B?djBUcHdMTGR5K1h1M3dQRWdrYmF4TWNHUDVtbFVYUUtpbTNtQ3RZWGg3Q0Qy?=
 =?utf-8?B?OEExRzByaXo1Sk40amRxNUJtMEhibzZyVlBWeHMzanJTYlhCT05KVTJwSy9i?=
 =?utf-8?B?anJaeTVLYVlRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D1361493882024A89AC18F9AD3B1DFD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7447
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7fe7a46c-29ed-4a91-7e26-08dd75c7d9b1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXNpTkVBMUVJTkFWZTJhTWNFb0FtQ0o0dDJ3Y1Fqc0JkVmpGQ2ZTL1V4NDBZ?=
 =?utf-8?B?TmN2VHZiSW1heGVWMEJyZlkzNWo3clVxVFZySkVhd3Y0NXdVU0hNRjROditC?=
 =?utf-8?B?Sk9GaC82TkZUVklteTBRT3Vwdmsxd3ZiZEVINUljb2hqaUpNWklVY0E3aHFC?=
 =?utf-8?B?T1RYSUlSWWxKLzEwVFN5K1l6Si9kVTVlNzdBelUwNnIvY0I0eUZ2MW1kL1ht?=
 =?utf-8?B?N2txMlUrTEZqbFBIbjlyZCthbTlrbnI1bDFiazJsVlh4eGJuU0xXMHJCUUJj?=
 =?utf-8?B?WmVTVHRYL0NVKy9ab2N4OHNPU28xRllQYllkYzFEcHdtVHBFa3ZiWmFkS0V4?=
 =?utf-8?B?ZWR3K3RhL1BwQkdHTzFzazlCQ1hrdGVHSkZCdWJQY1BFbXdUTHpIMFVLUm4x?=
 =?utf-8?B?Z3JVNGtFaGtMQk8yaFVFTm42emhTY29meDNrcEZraHR2Zjl1TU5vUmFWOEpP?=
 =?utf-8?B?TnVUUkcyeWE4YWgyNnhicUpzMmJNT1R2blJraVpiTExzcWpYYkcvditvWHVM?=
 =?utf-8?B?U0E2RU5Dd3BxN0R0UkdBdFF0SlVVSzZVMFVib2NLdDNheWpCbW90SlBKdWpv?=
 =?utf-8?B?SUcvb0hYN3hmMTRHZ0Y0SDFNMmsxRzNpcmVSSWpBNy84N3ZkVk4rYURmb2ZY?=
 =?utf-8?B?RUZOZFRtaFZ5eHVrUHpqajRnV1lsNlRmMkNWVDJRRUtEZGxGRy90OERXem9h?=
 =?utf-8?B?OHJIRU5wMFJiM1hNT0NwbE1MMnJIamRpNWp2dy9INHZlcVh4NmNNejV3REp5?=
 =?utf-8?B?a29CUmh6RzMzb2pwMGdwazM1cWVmbVdlNTVtMTd5NFVtOTlpWi90TFlVM3lu?=
 =?utf-8?B?UVNKbHg5cHo3OStlVFVZek53SVRuSzVnaWtsRG0rTTdiL212NUJPZmRLc1FO?=
 =?utf-8?B?cW1tYzZoZElMVWxpckw1aFVMelI0OVI3YlJyNTdaVXJxSGJsYmFZWDZjcCtm?=
 =?utf-8?B?U2I5WHdmc1QybFJlME9SQ1RLN1lTQjRUNEpyd1J1bkVXNUw5YTFQR3VUdDBI?=
 =?utf-8?B?OWx4UC9PYzVrUG1MbWIvSDRwOWdORWlZQnVHaXUwc1grVW94OGNJZGF2L2lM?=
 =?utf-8?B?c20veHNYdEpXSm0zRVowQzFpRzFQaGlOdXorZ3J4d2s1WWdNWTd4a0ZaMmZW?=
 =?utf-8?B?VUtyOEVYalc5UlI4M1ZvUUsrYzFkcjhEWnZDTkoyV0UwYjdVZ1FiY2VmT3dS?=
 =?utf-8?B?VmU2UVB2K3JYVVhYcjlXYis4U0pUU0pydTRrZWNqcUx6aXhUbHBkSnJGQWJN?=
 =?utf-8?B?cS92NldFM2gwdFB5VlpyYyt4SDBwVDNNemxtZ0UrN1pIbWxpNURCN2hXSDA3?=
 =?utf-8?B?N2kyYTg3SXF1NWNPUTFoekwrcTdOV1ZMWEJmUDNpVlh2dko5NWVxRFJhZzZm?=
 =?utf-8?B?V3l0Tk1uOFEwckVzR1EwUlpQa2RuNjB2QkpLRXI5UmNxYzVVNmNuRW1JazFZ?=
 =?utf-8?B?WUpVR1hmcHBBWkozOEdzV0FPKy8rWkwyMGJGalMvcHpxTHJzNnVITjBlMXNI?=
 =?utf-8?B?Y3U2cElYTE9vQWVmSGtKZXhqZUk3V2krdGxrVDIyd2tDaThUQlFQcG1JMFlK?=
 =?utf-8?B?QnNQeXo3ZHdMRjEwWHg5QWxkM1haeUhSaGNpMHYzcnhSbCs5NnBZY0RzRUgr?=
 =?utf-8?B?dEtXa1ZQUVhHYlNWcHhGT2pGUHo3Q3BTcGxnS3g1MFJJbjZsMTVETS90cnVJ?=
 =?utf-8?B?amYzYnNDeHNVeldVWmQyWHdTYkFlcnFXN2N0Q056TmF4Tm02MEJDTkJnb2tm?=
 =?utf-8?B?N0x2bUVRQjhwanh3cUt1OG5KVjE1TlNqWFpoU29ac25rb3FsbXczWThoYy83?=
 =?utf-8?B?R3JNYlZQcHYwWFRHeS9YVmV6OUpyQ0tFY2NRdGlOVHJwYWhwblY4YVVFWGFJ?=
 =?utf-8?B?WXgwWVAyeCs4L0k4MExJQ0hnUDd2VEdHUXlvTzc2SmpSQlNaM1NtbjE5Wnh1?=
 =?utf-8?B?SEUzT2pwalRjWlFkQ2tHRzNGUzFCSHpBK0svQW1hNE9kR1BkaUxjY1FWcVNZ?=
 =?utf-8?Q?lo5AFQw8PtXWs6wiQWjCg6a2CIGBHU=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:32:50.6500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9bb4bc-5411-41ce-9401-08dd75c7ede7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8353
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Apr 2025 11:33:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6451

SGkgYWxsLA0KDQpBcyBob3BlZnVsbHkgZXZlcnlvbmUgaGFzIG5vdGljZWQsIHRoZSBZb2N0byBQ
cm9qZWN0IGlzIGNsb3NlIHRvIHJlbGVhc2luZyA1LjIg4oCcd2FsbmFzY2Fy4oCdIHNvIEkgdGhv
dWdodCB3ZSBzaG91bGQgZGlzY3VzcyB0aGUgcmVsZWFzZSBwbGFucyBmb3IgbWV0YS1hcm0uICBH
bGFuY2luZyBhdCBhIGNhbGVuZGFyLCBJ4oCZbSB0aGlua2luZyB3ZSBhaW0gdG8gcmVsZWFzZSBt
ZXRhLWFybSBpbiBtaWQtQXByaWwsIHNheSB0aGUgMjJuZD8NCg0KVGhlcmXigJlzIGF0IGxlYXN0
IG9uZSBjb21wbGV4IGJyYW5jaCBpbnRlcm5hbGx5IHdoaWNoIHdlIHdhbnQgdG8gcG9zdCwgdGhv
dWdoIHdoZXRoZXIgdGhpcyBsYW5kcyBpbiBqdXN0IG1hc3RlciBvciBhbHNvIHdhbG5hc2NhciBp
cyBhbiBvcGVuIHF1ZXN0aW9uIHJpZ2h0IG5vdy4NCg0KRG9lcyBhbnlvbmUgZWxzZSBoYXZlIGFu
eXRoaW5nIHRoYXQgaXNu4oCZdCBvbiB0aGUgbGlzdCB5ZXQgdGhhdCBzaG91bGQgYmUgaW4gd2Fs
bmFzY2FyLCBvciBpcyB0aGVyZSBhbnl0aGluZyBvbiB0aGUgbGlzdCB0aGF0IGhhc27igJl0IGJl
ZW4gbWVyZ2VkIGFuZCBhcHBlYXJzIHRvIGhhdmUgYmVlbiBtaXNzZWQ/DQoNClRoYW5rcywNClJv
c3M=

