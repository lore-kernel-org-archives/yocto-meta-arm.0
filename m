Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33668C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 12:07:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.63])
 by mx.groups.io with SMTP id smtpd.web11.13652.1717589239967602874
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jun 2024 05:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OJAs67RI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=OJAs67RI;
 spf=pass (domain: arm.com, ip: 40.107.21.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GTGHrg0Pl957C9XJgFIeV76mNrAfIHhybpKLk7RZs4VZ3GI6vcDMQSVvjD3PfKtyK1f2Lb6Br2XHaFOSTiTk8mA7lKXlhrhl7j2zHjNjK0n7CzZfavBIRdbpHHvm0fGz2dvv0BSIOodkMO/F4rV0vEET76YUDncQC7JCI21hs/89agSAzq9D5E5S1zt9PhP5PKO5eTIMFE7IFmS29YBReJESwEUAnSlSrMv3P5KiKyJLjoxz2D/ksdrnoMYcA6L91UDzu9ONPGLksczM10J0buV8HnjI/kEA2hw6f/VuBRKo7DYb0ROhxjei3n+kl5C8wYrC6ur/FWWCAhrSCy2oMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEejHyFQ7pXj8Qd1dH1aU0Qj3fQO1xCiW2G5flpwdww=;
 b=kdUR7/IY7okW6CirTJtY5S3OLw+BGGArrIIi3g34S+fL6U4APlfxa/8dlri+jdWv06kuUHdB80NJPvynfGjUL0Q5+v+1ZcWfZkP89eFG8Buw/Pf339jRslSDY9+dq7DdbN3bfVgiQh4oNNBIgJv1akhRpTAqBBX+CHmS9bSt3M7shQ+IHXCsFsTTkNZxYmCqFzDLdM5JZ4QVm0BEgOTjQKNSefyukk5bBSerbCwxV0Z5qbi28UTEAdpyUVklLOenBzS/j+zNuhGHOIPkN1/2uWHG3VLS+8DkyFNDDsMObOptz18+gb6xqO+hecXAGRWGw6+hMwP8X46jgefiEOWt5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEejHyFQ7pXj8Qd1dH1aU0Qj3fQO1xCiW2G5flpwdww=;
 b=OJAs67RIDj7lk806KJ85TracOaFlOxQUJOOEvM+fsfbStV0nfdyTC28Y8Id+jRLj8JfU6odbYuVZlCq2r175bu3+YtRgtIwhdQGnW1b011JN/r7C5fjYzA0DOfInLaD4hCz+LRwUE0XukHMnn5PnPxbpRvHrK3orJ3B1JAtgP4M=
Received: from DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) by DU0PR08MB9630.eurprd08.prod.outlook.com
 (2603:10a6:10:449::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Wed, 5 Jun
 2024 12:07:15 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::c7) by DUZPR01CA0272.outlook.office365.com
 (2603:10a6:10:4b9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Wed, 5 Jun 2024 12:07:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Wed, 5 Jun 2024 12:07:14 +0000
Received: ("Tessian outbound 54e6fdfbb8cb:v327"); Wed, 05 Jun 2024 12:07:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 800726ee11f4fcb1
X-CR-MTA-TID: 64aa7808
Received: from 9023ddf7b00a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 94594C9E-071D-40C4-8303-933F72EB445C.1;
	Wed, 05 Jun 2024 12:07:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9023ddf7b00a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Jun 2024 12:07:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHt/9gtjZwCWJ/PYv498tprhr2dPTzWPh2nxp4NgX40rMt1pWMa1N6DUXA4NhgtFrmCQJuofrRSXzjWjVC9Rd2vA/sKkT9vISyF9a2k2bPPIjlpL3DLBgsRTHwcHxxGMn152cKqlAFIQGQIoU00XDmmvduaWMnozEzYnHKpNuKlyQIGZEk1hFXdswDqeNLS6xHYeuTXiifS7N7cMWPAVhv/stHomdzTDtuFr7y35rCBAFA3sblE+CTUOXD/UO1+7SzM+Eh8oT9i0ealsAj4laqZ111g6Cb6Jo6ie613vUYyThaCvdSp+3ZZ5D8sosgD+JEphNFHq0ckBACliNN+IFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEejHyFQ7pXj8Qd1dH1aU0Qj3fQO1xCiW2G5flpwdww=;
 b=WLnSB1Ttln3xIsT4RO/viVn00oTtzi91RiTa1H0I/MREHrvJOtKrEh8DHcaaIAB8R106U12JQ5y42GhxjVn8b9Krc7L/teLZLSItifxiQ450m+Bapxe+bR7VsGpDNMVh5roeekigv4GeSQRewhfG7YDD7FouJQ6r74XP2+8q91jIiXLkrF38gtIN3xklFtyEbmqHhJA8C0WY18XeF/TjTEmHjzPCe/8gRRpGjD4Bngm7vgNN4O9M0DdLZ3hc4ZBsPb+Downk+DjWpQ6KYFjRcGhG5/EOKxOujUgj2OXY2Wt8h9sb45Pdaf17zGM2FLnVSOETWnlroatQeL9ynqQw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEejHyFQ7pXj8Qd1dH1aU0Qj3fQO1xCiW2G5flpwdww=;
 b=OJAs67RIDj7lk806KJ85TracOaFlOxQUJOOEvM+fsfbStV0nfdyTC28Y8Id+jRLj8JfU6odbYuVZlCq2r175bu3+YtRgtIwhdQGnW1b011JN/r7C5fjYzA0DOfInLaD4hCz+LRwUE0XukHMnn5PnPxbpRvHrK3orJ3B1JAtgP4M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8496.eurprd08.prod.outlook.com (2603:10a6:10:403::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Wed, 5 Jun
 2024 12:07:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 12:07:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Moving master CI back to master
Thread-Topic: Moving master CI back to master
Thread-Index: AQHat0Dhrc5BtzSaaUap4d1j1OxRTA==
Date: Wed, 5 Jun 2024 12:07:05 +0000
Message-ID: <43B24EB0-E5D9-452B-BEB7-A89DF6A82DB5@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8496:EE_|DB5PEPF00014B8D:EE_|DU0PR08MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a01b86c-0d0a-48c9-dcaf-08dc855809a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aHhrOW5zOHdleVVUUm83UXlMbmZmbG5acVY4T3RzeWlSTXpCbHJKeTloaE00?=
 =?utf-8?B?cXZSSDBnaTdUNkpuY0FUMExVQmpUdmtkaDhuVnpkMFdiL1laczRUWXpocW9E?=
 =?utf-8?B?dHorUFZzemV6Y3pVaG8xZGRWNkcxbS81UkpONVMvQkcrMG5OR2VUTDYzOE5R?=
 =?utf-8?B?YTRpajViM2pub1FNbnFhSW9ReFppTWxIUDNCTnp3ejRNK1pCam9CVVRzYTFo?=
 =?utf-8?B?MG4xUEJoYWNmZjRnQzBEaWZtUXg2USt1MzVCelFvZFR4cTNiY0hmWk5uWEc4?=
 =?utf-8?B?MUp1bEtBWXV4WjY3T0hiK2JaR0dMQ2RsbWt1U01qRDc4bWtjUHNjd28yTS9B?=
 =?utf-8?B?NHRtSGo4SWtzN3FzQWx6NWNjK1ZER2hRbDltVEw2TzVUZUtibWViOE1rVVFT?=
 =?utf-8?B?ZnM4RlNKZWFGenRzeUlBa1FsMmhXL0x5MjVkWFVjZmVhOW9VQ1BrdC9oZ0RT?=
 =?utf-8?B?ZE1HM1VoRHNUTzBUSXBCY1daMjFGQjV4VDFSbTBHMUo0clM3UG10aDJrcHZW?=
 =?utf-8?B?Ly9pVDM5cEU0TG96VlhRSWdFNUZRUm9UMHR2K2ljSmpoYTJvQXdXUnRMRmRZ?=
 =?utf-8?B?YW5JdXFLWU1rQjRvb2ZLK1A4Rm9GcjRtQWZBNGdGelVMZTNzOStWbEcrb3hm?=
 =?utf-8?B?V2EyaWRGMlFLYXFlZmd6cnZJQ2YyMzhJVEJLTjdPYzJWZGp4b0cvY3FrWlhP?=
 =?utf-8?B?ZExKWDdXaXg1Z1pWWjh5T3FzcklMZGpJZmhPeGR3OU43WHRtd1gwU29CUVB1?=
 =?utf-8?B?Uk1YSGtFU0w5ZTBORERSalJyRGVHam1uMlJwS3ZocFovenFhVjJrekM5aWxB?=
 =?utf-8?B?ME1XV1RLWnF0MlBHa3d5L1dva1YxT0VvUG9GOGhsWExIS3hoY3A5d1hhdWp0?=
 =?utf-8?B?RDJzV2pLNXNPcktjRVNzYzNjR0tYcjFJMlJuVnNJSE5Oa01mOXF2Mjd6cWRx?=
 =?utf-8?B?aVhlUWIrSG5pbzRVM3U0Qzk2bzZSZjFySEs2Y0hqcTlZaTJZcEw1bi9WODdn?=
 =?utf-8?B?V2ZXcGRZYTR6YUk3NVJ1NjFUaExxTzBnOUJ2QzJpNWJ3d2t0YjJhOVdIS2Y0?=
 =?utf-8?B?azNWY3g1QnNuRUc4MlY5bW93UHFKSEg0Rk40WUtmQnMzZXNrSEVLempYdFo5?=
 =?utf-8?B?TlAwTHkxRW1qb2dqTWJkSmlpSGxyQjhrTlEzb1FSTXZGSWQ3MzBKRzZOQ1JI?=
 =?utf-8?B?NkM1NW5Rb2tqQkdJaHNYVWdvUTRNYTRYbTNTRnlUSHJ2TmVLK05lODc1alN4?=
 =?utf-8?B?YmtncWFCemt5SHZaei8zU0p2ZTNHT0dWeVJPN2pNVVE1dGJ4ejczbUhZTTRh?=
 =?utf-8?B?YzVFTG9rd1VBYzIvOTBVM3lkQXN2aUk1RWdVSlM2ZlJxNHBQVm1ubERTN3Rh?=
 =?utf-8?B?eE9ZMyt4dFpKYzhEK09IZ0hDQlllT2RkS0RyUW9NNXBsRW9mMlVjZGZhZ1g3?=
 =?utf-8?B?RmJvcnlJRSt2UkJnZ20vRmJQR3Uya3J0QTdxY3hEK1hYa05NakNwWFJNTGt4?=
 =?utf-8?B?aHU0WkJaaW9QODU2aGpNYmdvNlZuOEFWRlpKWnFnYk0vZ2tuSUJoUDA1OWpY?=
 =?utf-8?B?TVQ3dDFhTlFyNitaMSt3VHRqSVRlTVNBamJDa1V2RGpvekdiVE1sMWRRaVMz?=
 =?utf-8?B?WGw3aTd2SllQcDRCL1lSeHVWWVRwMUgzN3YrT2xnOWlNcU5kbFhRdnd6OE1J?=
 =?utf-8?B?QWJUc0lHVVVIMUZ2Smx6Qkk5azFMUWQ5djFJdEJ5Sk1NOGZZbnYrMDNzWHRx?=
 =?utf-8?B?eEVYbE91aXdGVzVpaXkvbm5tWnpDb1NGcHhuVzl3bGl1MnVOSE1xc0tNN1Fm?=
 =?utf-8?B?RXQzdHVHUHQvK2VNUElsQT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6152C9626B01AD4394FB8C0FEB9CEF9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	71437096-eede-4db7-3b1a-08dc85580442
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|35042699013|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjZMa0RDUlpQU2o1ZmlVeElYRm5yRHlQQjhmbm9wUHdOQ0dOQkJXUnpGNXFo?=
 =?utf-8?B?bGhDeHNFRnVCeVhFYSt6SlhrMlR5SGFBeDdtajFLSVdaM043WDJsQnB3THZR?=
 =?utf-8?B?dUxmMHlhM0pEekNvUUdoc05FOEtmdURkeDNLNzNIVFVHL0pkOUptMlJ3ZkJa?=
 =?utf-8?B?ZEd6OUIyZXVTa2hnS2FxNUVhTFk5Nk9ORk1oV09NMjQwYU5TTXFKajRvTmlp?=
 =?utf-8?B?M0NvUmZKbnNlV1BQZTJmL3BzMlE1N1RSeHNHcXphSjlhdjNnanpTdXF3bGY4?=
 =?utf-8?B?VFR4K3RMbzhMWFJaN3d4VGdHWnJ0M2t1b0hNWnladktocnJ2VENacGoxaUxJ?=
 =?utf-8?B?L1dJS3pPTzN6TkFOcmFJMzdkdHRkTlBhSmQ5dFhQWXZTak56T3kycHppNzB5?=
 =?utf-8?B?akRqM3NYd1pRc1RYTzh1R1FLNWgwNERhcjlIdXVCQkhmeUJKc1R2UElsMkU5?=
 =?utf-8?B?MDZ6ODgxWnQxVG1SVTUybEtrcnFld2hEWm04amRZSTNkSmJqOXB0ODdBTGc2?=
 =?utf-8?B?RlhGRmc3TXBRVTRlN2tDcXY2QUk2UDEvZnVBbUtFamdGMGhFNGN1WVZGRy9Q?=
 =?utf-8?B?c2I1T2Y5MmlCcXRmVUx6V2UxeTNjMjQ3NkdvZzlpVW5ZcXJ3SGZwQ0ZSTzBx?=
 =?utf-8?B?RUhpamJJOWFMbU5pVWwycE1BUCtVU3FaZEFqRG15d05OTk93YUlBcGJYdE1K?=
 =?utf-8?B?UG9yTDdHNkQrSU9jazlGeHhNQTZPaGdERGhaZzQyVURmL3Bnc25aMTVDby9C?=
 =?utf-8?B?YXNDK3ppY0V0emY5MnVuTGpkd2hjOGpkeXd3RTZiRWttQS9VeXhtb0daK0hS?=
 =?utf-8?B?U0pFUzBIZW5hc28rclFCQWVlVEsxM2RiS3R0c0VJYXBMMGd2bDk4YW1ZR0k4?=
 =?utf-8?B?T0d5NFljV1hUQ2N1WnRqdnNYb3ZtNkRvTG9pOGprRTFVZ3FXazR4U3UrVDU2?=
 =?utf-8?B?dmJPd1NmWkZxWnpxY3JBMWRGUkR0WmkzUXpzNk9VY2xNVWJHOHVUU0ZzV0lz?=
 =?utf-8?B?WWlta1d3THBtV2xJOGNBN1JKZWVtM2VHWFNRYlBydW9iUmFHbmFpUjlqcStj?=
 =?utf-8?B?ZzdPOXVRdGFmU1ZJQVY2WXN0Z0poVURiaHRGOVRzLzBLR1BtQ0R1anlBTWhm?=
 =?utf-8?B?SUhnSUU2ck44V1lIdHlPbGEzcGRIZzZjMkpOb0R0aXRsc0FwMVFaTGw1ZVpN?=
 =?utf-8?B?UmwxeGl6R3NXMU1yQnc5TDVOL0ZGbmZjdCtBUys5c21xUmNwRVRUY2d3MVZq?=
 =?utf-8?B?blVKVXZycnBvOHZPQTJncDczZElPRU9VbGpZQVI4dWJjekFKZk5sS1J4Z0Qr?=
 =?utf-8?B?blBxM2hQcEIrUTlQcWVWYWdRbk01UXZZa2JoY2pOdzR4M201MXRHOC9vREN1?=
 =?utf-8?B?UTZZdTZQM2lTb2puYVZ1azh6bUs0UWFrMVM3VWQ5WE1JL1NyQjlXRm02YWlq?=
 =?utf-8?B?Ky93T3JPelFzNjJYM2l2d2puR2hubGFFUkdiajRtSWt1bk5abkw2dkFKUldx?=
 =?utf-8?B?WXM4R1lkTnB3bVRZemFUeWtZUHhtYVhwd1V0VVU5RzliUCsxbkJnV0k4RGs3?=
 =?utf-8?B?dm5jUy9WMmpUYmFMYW1kY3dnYkZuQzBGYjJ3SmZVZnF6MTBTNGFMK2Urcm15?=
 =?utf-8?B?Q0JpQlFNSU5HbW1rZXFMUncxcERZcUZiYU9hV0NWNHltNHhDM1pwRFFGU3Fq?=
 =?utf-8?B?eFNzeVlPRm53VFIxTjhWY0svNHZGYm01YVoxYi9sLzlkcFFIczVraGdZRTlU?=
 =?utf-8?B?cVg3c3FuaGlsbFNJY0huSjVrK2loaStpdHZVVHpDTnZzUDdPTFFIZldaL2da?=
 =?utf-8?Q?AeLD10gy87OcaVukJ4YSKZCDRkcUBnXZHKyQU=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(35042699013)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 12:07:14.4961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a01b86c-0d0a-48c9-dcaf-08dc855809a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9630
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jun 2024 12:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5793

SGkgYWxsLA0KDQpBcyBlYWdsZS1leWVkIHZpZXdlcnMgbWF5IGhhdmUgbm90aWNlZCwgdGhlIENJ
IGluIG1ldGEtYXJt4oCZcyBtYXN0ZXIgYnJhbmNoIGlzIGN1cnJlbnRseSB0cmFja2luZyB0aGUg
c2NhcnRoZ2FwIGJyYW5jaCBvZiBvZS1jb3JlIGluc3RlYWQgb2YgbWFzdGVyLiAgSXQgaXMgbm93
IHRpbWUgZm9yIG1ldGEtYXJt4oCZcyBDSSB0byBzd2l0Y2ggYmFjayB0byBvZS1jb3JlIG1hc3Rl
cjogdGhpcyB3aWxsIHVuYmxvY2sgdGhlIHBhdGNoZXMgdG8gdXBkYXRlIG91ciByZWNpcGVzIGZv
ciB0aGUgVU5QQUNLRElSIGNoYW5nZXMgaW4gbWFzdGVyIGFuZCBsZXQgdXMgaW5jb3Jwb3JhdGUg
YSBudW1iZXIgb2YgdXBkYXRlcyB0aGF0IGhhdmUgYmVlbiB3YWl0aW5nLg0KDQpXZSBwbGFuIHRv
IHN3aXRjaCB0aGUgQ0kgYmFjayB0byBtYXN0ZXIgb24gRnJpZGF5IDd0aCBKdW5lLiAgSWYgdGhl
cmUgYXJlIHBhdGNoZXMgdGhhdCBhcmUgb24gdGhlIGxpc3QgYnV0IGFyZSBub3QgaW50ZWdyYXRl
ZCBieSBuZXh0IHdlZWssIHBsZWFzZSBicmluZyB0aGVtIHRvIEpvbiBvciBteXNlbGbigJlzIGF0
dGVudGlvbi4NCg0KUmVnYXJkcywNClJvc3M=

