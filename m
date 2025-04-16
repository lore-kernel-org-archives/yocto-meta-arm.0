Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972C2C369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 12:40:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web11.18201.1744807245679350813
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 05:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RwdgkJIo;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RwdgkJIo;
 spf=pass (domain: arm.com, ip: 40.107.22.85, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DkTjcd2U4giEjgXG4tOfP+36qRMQpUd9ewYIor4ebkvogkiXb3+VDQ7Q9QFRy7M+m0gTiWLvsxZdCrpJx3upW3g9augArqbmpLoCLY6Vm88Gl/jisovRyv0iI/fy5jyuUzU1e7BDlGXUizpiGv/HeWTBWX1CxT0TlzI8Bj3IiT+nbITDCiRxIWRlGbeiTwBCarl2/Oturc/rv1rJFUN5T4NB5BNq41+bDrZYTytGmgfnmkinbveNyhq/25jO6dA8EKQy59hLNzSa2S7ssFbY1kKog/9q2I69WPgaAodo4N1cDO7iebVs1iuD9hHe04gMBKrTVDfJjZvOEHwKqVMgfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=900Dr5nPMz19By0oiyunyH5BGj646AKsrZxX06rigEU=;
 b=wgqe/v+qhQQoeO3aCYYHPbL3c/Yp+TWCYVDvveCgExLbwKgtU6KCbsmDFd6I4/9IpHCJtahpKeY9yViXkXZXe7S1nsuKpryJo1SYIt9Ry4zudihT6j677Nc1fitDD5VACrT+Nyfl0XjaZ3Rfum9EjwS/BNfXXMJJ5R0EW7oZtqfJ2egiD4btcbN2vU4elbcVSGM5lTf/0PU6rkYCJ72GiMH7XUizt0xmpq/6Zk6Taz8FIi27EUk3ylwhRgwskvnGWcpmRG09oK+epRSYkOcgSP8Rv/ulHAs4ZSNXS3zwtBo+zHuvrUHXfWFG9Mc+vvt4WYdpQgXDcm12WmxZEuKDbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=900Dr5nPMz19By0oiyunyH5BGj646AKsrZxX06rigEU=;
 b=RwdgkJIoX6GYMOrwcqAnETglRV/hcaLEyHkMb57cL6/yanFbj5uLEAtXodMukAmi0W2wqzCVcXloD44whuhW7UJa412qIDqTo4fztM0eVkv7aVJT6eKsI4yCQdu0tKrDXnzvKsmtXKbYqV9FPsN+IltQvQeyv19XCrbA4bHjIJA=
Received: from DUZPR01CA0342.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::26) by DB5PR08MB10024.eurprd08.prod.outlook.com
 (2603:10a6:10:4a8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Wed, 16 Apr
 2025 12:40:41 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::71) by DUZPR01CA0342.outlook.office365.com
 (2603:10a6:10:4b8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Wed,
 16 Apr 2025 12:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 12:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJy27xXeDhZvr0tAVsnhE65IbdjiET9r+/MxRWPxLaP3f+MqMrCxH7kWonxs8c77w2HNVbCJl6yTz0kDiypQT3LUTpzoFSOE9zIYuKzqF9KBY8V7mdyqdfRNp8x6RcrwTv+9rr0AckWg+mr76PXkvWLSM3yGPHRTkLMogNiY/eXKJJS4pGfv+2O3m/MghaKBLU5PsSIbOVQkFIJiePIB3xS/1IvT0KVvyuV1LSsJDDz8P27mimoSZUK4K+qVq6/QyUefi23PUDBmvhrMKPe6hGKljmBOi+Gzyownbf9awy61XCucFwYHmNfuHl2WJwGLXjd5VQchrnb0hxaCjpesFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=900Dr5nPMz19By0oiyunyH5BGj646AKsrZxX06rigEU=;
 b=QO8auTDlYK7mhOfFWuccxCKD4FXJsTc02Uha/ue+G56ZToURCTB0FHhdNZ0IsQO8LL1SuitGI9ptTY5FPCnUunuDKfc0Djlw3nNruW7ZXBg9votDD41JrWEE7Lz4ktSwenTsQcdwusEyU5VzVaIXuSduTCUyF9G5HaRX2fiaETebD93k6FchUxwZMFkc2PGOWkao2edrKIBI7kziqkY4j7fQ34eEecgKD3EVSEHzvjxT5yI0e4KOJK9YLBCe/UaHj+WTuBtP9cNnc4GjEZeD4Q0fY6toblwV8ZTDHHpxbEW8amjYWcM2I/wimauK7Sk8EL0aVXHBjma0/XJ+4ATCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=900Dr5nPMz19By0oiyunyH5BGj646AKsrZxX06rigEU=;
 b=RwdgkJIoX6GYMOrwcqAnETglRV/hcaLEyHkMb57cL6/yanFbj5uLEAtXodMukAmi0W2wqzCVcXloD44whuhW7UJa412qIDqTo4fztM0eVkv7aVJT6eKsI4yCQdu0tKrDXnzvKsmtXKbYqV9FPsN+IltQvQeyv19XCrbA4bHjIJA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5749.eurprd08.prod.outlook.com (2603:10a6:10:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 12:40:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 12:40:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] Walnascar release plans
Thread-Topic: [meta-arm] Walnascar release plans
Thread-Index: AQHbp7C3nPcaBuBsFU+Nq0YMTwCZ7bOmSe8A
Date: Wed, 16 Apr 2025 12:40:07 +0000
Message-ID: <EE6AB8D1-F759-4572-A3F7-434CAB9B0BF9@arm.com>
References: <1834060676E85166.21691@lists.yoctoproject.org>
In-Reply-To: <1834060676E85166.21691@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5749:EE_|DB1PEPF000509EA:EE_|DB5PR08MB10024:EE_
X-MS-Office365-Filtering-Correlation-Id: 087e5bff-e11f-4ab0-8e44-08dd7ce3e4ce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NTVka0FZVGNjbzM4MzRnV21xdWJHWGhnVjlTaThEYzZrMUFnVDJMK0xlWkQy?=
 =?utf-8?B?QjcrQlFnSFNQeitiOGwwNCtmMElOeTVwOThjOGlvS0p4aGVPTGVIeUdkQ1lz?=
 =?utf-8?B?YzZhaUpTYU9kbjFZWVdzS1V1S2c1MURoSGVqQWdMNllGeXA5SVdTVWVsNFZz?=
 =?utf-8?B?akpGKzU3cnVoY2VCN29sY01ORFlsYm9EN2RRL1RURmtOQXlEUkZvQVVTYVRI?=
 =?utf-8?B?SGNKUlFqKy9xVlRwdFhoa2lYS0R6YnZUNnNWcndneTJhcjJQNHMwYXFZMUZM?=
 =?utf-8?B?WUxhSWVFUlVrbXQ5STJnc0pEemF5ZEJHT0gybmFpK1FGYlJtZ0hiNXF4emRr?=
 =?utf-8?B?STdRcVZBR1ZWM1h2ajdOaTBWUWt3KzBZU3BSbGt2b1Z6TWpuc1NkSndwamhK?=
 =?utf-8?B?S0NUUjFHaU4ydC95UG1tRzhmNXV0YUVNdlRrQ0FnMHU1SlVXNWpkT015WDNw?=
 =?utf-8?B?YVVScTVmcUhDZkUyYVNuMk0zcmRHMjVyVjVsWkQvRU5IdmFWeUNmeTljTFJ0?=
 =?utf-8?B?VnljZ3k3M2IxOWkyR0owVlUvZzE1emN1djRpUDJET3JRTFQ1RW9GU3hSRFNr?=
 =?utf-8?B?c0w2eGVWRUZrMXM4Nmxwb1B6QjkvM2ptZkpjZmo5Sm1pQ3lWRjJ6bnEzNmJp?=
 =?utf-8?B?M0FHQlJydy9KT1BvWW5rZCtEK2dvT1JKdnFtOUZxMXpyUXV4VjY5OWhWZzF0?=
 =?utf-8?B?clNHZXBaV3hVMkhhL2RiRmxOT0lsYm5yTUpVYVJJc2pjUzQ2ZDZ2bVdnS29j?=
 =?utf-8?B?MUg1R3hTZ3FvM09uVlYxaUpkMm8rMkk0Rk1za2tsRXYxTzRCWFovSEVONEhZ?=
 =?utf-8?B?N3pYOWtIK2pWNmQ2WWV3TU9rcUFwMkJwUVExMWRpOXNNZm56S25KQnFiZFMv?=
 =?utf-8?B?S29BTkRNaXFjdHovTkQ3c3dBdUREaUp1WHh5OHJ6T0tJTEFIWEJPN0FsYlM4?=
 =?utf-8?B?ejhUN2M4SzRwdjRVM0h2VFdCeTdpamkrRkVwT1dGOTMxSmVXVklMaGkxQnlp?=
 =?utf-8?B?V3pBVnpqUUxYeWg2Sm5yc05GdHJxK2hIeG9EM2pBc0M3RCt1Q3F5MUhkK3Z1?=
 =?utf-8?B?RkxnMm9ONHkrNExMaDFmQjhMdHNkaFhIYzIwSXNmRUtqVkFzNWI4VE9hVUZQ?=
 =?utf-8?B?Wkt6Qm05cmkzZENQUFUvbmN0QjliN2kyT1M1L05vVVJMK2hsYjN6bEMyS1dE?=
 =?utf-8?B?V0hFN1U5dThLcHhxcWhMVGZWVnpQMEVmMjNlVVVrdnBrODA1M3hRM1o1M3BW?=
 =?utf-8?B?NjJtMDJ3QXVJWE9BTFFNSjhEWkN1ZG8yaEFoR3UxOThEdHJiZkZrL1ZYVldi?=
 =?utf-8?B?TjB2QUYvRVBKTWdkZ052WDEzeDJnaC9xTWVKV2Fud0xkcC9DY3ZYUkRFdDVy?=
 =?utf-8?B?clNlVHVZL0Yvbm9Vd2c3VnNFM3l1THZMNW92ak5TeitwRm8ydFdQMWl5aXpq?=
 =?utf-8?B?c1hwZDdKcy8vMzJJZUdWSUw4RExXdXdlQmFMSngwRTVJUkhYRENjZUlNbGRB?=
 =?utf-8?B?RVdkSEpRRkJDL2pXUCt4Tmc1SUhPdUtxbHZyTGFIYnZsY0o5WDExVlBZZXdZ?=
 =?utf-8?B?eVNpUXRkdGNaN1FKb3dma1dXWE9SbVRtRGwvZFM4V3VtQXRNV1B6M3gxUkVa?=
 =?utf-8?B?UE9OY3JXYzFpc2I3ZFRaMjNYZzVHeVFaUDNKQzljVXMwdG9FZmNtSnZjS0Ro?=
 =?utf-8?B?RUxmekYvLzJtTTZUVmhvcW9Ra1FicjJBQ2J5ak1sL2Nyb0lhL2VpVlNqQmds?=
 =?utf-8?B?eGliRkZQQ3FQdzdjY0pVNW5laTVSNWhZUXB2WHhHL0VkckgyQzRRMDc2N3h6?=
 =?utf-8?B?Q2g5cEhiWCt4RXp5Ym5PcGJRVGFVSlZ5QUplQnlqSUtXbnNaUTlBN2g5ai82?=
 =?utf-8?B?d29WUlN5SGZhM1ZiUGpoWjFDcXFxKytycloxSm9xY0pkb1hpZmJzYndrQnVW?=
 =?utf-8?Q?+lKg0ZzZ0ug=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AB83F3F01772148B017AB30F3B0B7EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5749
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7602d355-4c33-46d0-4d3a-08dd7ce3d18b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|35042699022|14060799003|4022899009|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUVjQkI1NHdpUFF1Z21OVm5OV3puZmVjd08zT0dlUVovOWVuT092Z2tjL28r?=
 =?utf-8?B?S1RFdDltWTZkY2ZGNFZrVE9YQjJveWdlVXY4RmV2d1JtN1hjWHNrZUtYejg5?=
 =?utf-8?B?Sjdyb2w2UEF5YmZuUHMxaVg1Nm85RXMyTzg1RVlpb2MxT0I3WUdsUDEwZ01U?=
 =?utf-8?B?enhRUVNIS2pGWUp0KzZMUCtFdUxUSHhvdHFReXNjdmQ1eVB6SVhMd1R4SXdX?=
 =?utf-8?B?dTVaTjZ4aUp4UWJpcDlWVkpLT3c0UjRKUyttM21qZFh3b2FWMDNXU1dQdTZW?=
 =?utf-8?B?NFlXV1FJc1lPSy9ZaDNibDBMNnQzNGNJbmhtVXRTam9yWU82U2RBeDFkOUxq?=
 =?utf-8?B?YUFwakVJVG9wSmE4WlF4MlI5bGtRSnlNTUZYUnptak54N0R4NEg2TFNVdE90?=
 =?utf-8?B?ZUVsaFJrNUJHY0k2d0FiM0gvamt5emZpSy9hdlB5SWVsSGFkSEtadVFlV2FB?=
 =?utf-8?B?eGx0bWgyYzhuRStjRjZmWFdGWHgzQWkwWnhpdWt4WGJQMU9yNFM0L3oyMERl?=
 =?utf-8?B?S24yL3AwbnhQYWE3RG1JZWR2YW1KYTFySlhzYUR2M2M3TkVoQldPaCtrTHhT?=
 =?utf-8?B?NUpodFNEbUZyMFcyTENUUG8ycnlSTzVCTlovUUxBdHMrcG1zbEFMdGtjWVYr?=
 =?utf-8?B?T25ZbzQ5WDRMeDZRTEptTCtHWE1YbEZ5T2JPazJnNDRaM0l0bjVBN1RiTHdW?=
 =?utf-8?B?dm1UQzJWOER3cTUwd1Z1Q2paa3R0WWI0V1F5SW1HRFlsalovZS9ISy9KakIv?=
 =?utf-8?B?NmZSNis4aXhKTmppazJ5YUxoYklBblFyQzlCQXVVaE5VdVVUM3hlODJJOW40?=
 =?utf-8?B?UndjUzZzLzNjL3RzOVVvQ3l0R0oxd1Iwbjg1RGJiait4cEtKU2VSTytOZDFO?=
 =?utf-8?B?c0w1dGlhN3p1dXBBUTJvaGxLRkRWUjFyTjdHVGowbS9pZ0dJS3FmQnVZZlVs?=
 =?utf-8?B?NTM4L0lQRmR6Z1dxYW53eHk5SzM3d1FzcGRYbENvNVhDKzJlWTJxcTBpMlE3?=
 =?utf-8?B?N2ZtR1p5TTAwTmN5b2xGQ1Fmd3FOM1l5aDJtcXh6VzFQMW1ZTXRUY1BvQWNp?=
 =?utf-8?B?R3I2WTVqeTJhRTdOSW42VHZtNFQwQVg3VEVwOXdsbHdSTzQ1OWkvNEpYeXQ1?=
 =?utf-8?B?Yk13b1lOOEJmQk5xaVVsSndadTIvU0xJYnN6bDlHWG9ZZGNSYWpaVlRIa1Fw?=
 =?utf-8?B?Nzg0cjhrMERoWWtWM1dtTGt2VmJWMU9TKzN4bDRiMFBJbWpxU2h6WFhCV0Nl?=
 =?utf-8?B?NG9Ddjlyc2tlSWtzOHF3aDR1cnZFZDVpbHZJMk9HSUNQZHNhZUV4REJUc3hM?=
 =?utf-8?B?KzNGSVMxMXk4cHpwbjlaSzBFUWwwNm92QTROek9oNm9nODJDZHBnVGRwZCtZ?=
 =?utf-8?B?L3AweEhvSFFwcWVFTDBsU3NKdWJrbUlKd2cxT2FLaTNRWEpKR0pXVTN4cTY2?=
 =?utf-8?B?ZDEzOG1NZXpxSjR4bUxjMXBnS2tzZnYyazh3OWxzbjNsY3dGWWltT1lLdzZC?=
 =?utf-8?B?NVp3dWpVVGYzWDd3a2RHak5ZNVdLNXdLUFc1L2dsbnhRa0ErT1ZROThvemdU?=
 =?utf-8?B?UUpyUzBucWRCVWwrWnRxd1VVWXYwUlFFN1VHSStIZVZXTzkwMUxyTVd3cDBO?=
 =?utf-8?B?aUNZSUo5TFd6NUErOHFxTUFDSmlMT2g2Z0M1a0hEc2trRXhaV0htWEcrSzBK?=
 =?utf-8?B?L2ZkamxmNTVSeXBhSTBxUlVBOVV5ZXMvRGUyUHp5OTBVUDhOS2JvRnVlN3ox?=
 =?utf-8?B?amQ5OFd0NXdkTFFINDdsSnE5U1hRaERxTVFPRHQxSnBtRFA4UGxKU2lnY09C?=
 =?utf-8?B?eUlpejdmeTZHWXA0dzNxYVE3cGJPMXpGSXRDNGJNRFNaNWplS3c0WmljQyt3?=
 =?utf-8?B?SCtXRWl5cHZwYUhlV0pBOThxdFhHZkdSb3JTTXZaeWg0TWRKczUzYWs5cFE0?=
 =?utf-8?B?Q3Z2azlTNE5JVWszM3lpYWRaNlpJVlg5VXJiazhxaTNqK1MySDZMcHkyODU3?=
 =?utf-8?B?ZGlub2k4elp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(35042699022)(14060799003)(4022899009)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:40:39.4172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 087e5bff-e11f-4ab0-8e44-08dd7ce3e4ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10024
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Apr 2025 12:40:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6465

TGl0dGxlIHVwZGF0ZTogdG8gaWRlbnRpZnkgbWFzdGVyIGJyZWFrYWdlIHZzIHdhbG5hc2NhciBi
cmVha2FnZSwgd2UganVzdCBicmFuY2hlZC4gIG1hc3RlciBjb250aW51ZXMgdG8gYnVpbGQgYWdh
aW5zdCBtYXN0ZXIsIGJ1dCB3YWxuYXNjYXIgYnVpbGRzIGFnYWluc3Qgd2FsbmFzY2FyIGJyYW5j
aGVzIHdoZXJlIGF2YWlsYWJsZSAoY3VycmVudGx5IG1ldGEtdmlydCBkb2VzbuKAmXQgeWV0IGhh
dmUgYSB3YWxuYXNjYXIgYnJhbmNoKS4NCg0KUm9zcw0KDQo+IE9uIDcgQXByIDIwMjUsIGF0IDEy
OjMyLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cm9zcy5idXJ0b249
YXJtLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IEhpIGFsbCwNCj4g
DQo+IEFzIGhvcGVmdWxseSBldmVyeW9uZSBoYXMgbm90aWNlZCwgdGhlIFlvY3RvIFByb2plY3Qg
aXMgY2xvc2UgdG8gcmVsZWFzaW5nIDUuMiDigJx3YWxuYXNjYXLigJ0gc28gSSB0aG91Z2h0IHdl
IHNob3VsZCBkaXNjdXNzIHRoZSByZWxlYXNlIHBsYW5zIGZvciBtZXRhLWFybS4gIEdsYW5jaW5n
IGF0IGEgY2FsZW5kYXIsIEnigJltIHRoaW5raW5nIHdlIGFpbSB0byByZWxlYXNlIG1ldGEtYXJt
IGluIG1pZC1BcHJpbCwgc2F5IHRoZSAyMm5kPw0KPiANCj4gVGhlcmXigJlzIGF0IGxlYXN0IG9u
ZSBjb21wbGV4IGJyYW5jaCBpbnRlcm5hbGx5IHdoaWNoIHdlIHdhbnQgdG8gcG9zdCwgdGhvdWdo
IHdoZXRoZXIgdGhpcyBsYW5kcyBpbiBqdXN0IG1hc3RlciBvciBhbHNvIHdhbG5hc2NhciBpcyBh
biBvcGVuIHF1ZXN0aW9uIHJpZ2h0IG5vdy4NCj4gDQo+IERvZXMgYW55b25lIGVsc2UgaGF2ZSBh
bnl0aGluZyB0aGF0IGlzbuKAmXQgb24gdGhlIGxpc3QgeWV0IHRoYXQgc2hvdWxkIGJlIGluIHdh
bG5hc2Nhciwgb3IgaXMgdGhlcmUgYW55dGhpbmcgb24gdGhlIGxpc3QgdGhhdCBoYXNu4oCZdCBi
ZWVuIG1lcmdlZCBhbmQgYXBwZWFycyB0byBoYXZlIGJlZW4gbWlzc2VkPw0KPiANCj4gVGhhbmtz
LA0KPiBSb3NzDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2
ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAo
IzY0NTEpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLWFybS9tZXNzYWdl
LzY0NTENCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcv
bXQvMTEyMTMwNTg1LzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG1ldGEtYXJtK293bmVyQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL21ldGEtYXJtL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiANCg0K

