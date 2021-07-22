Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.84])
 by mx.groups.io with SMTP id smtpd.web11.6493.1626953662183275108
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 04:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=h01w8rQC;
 spf=pass (domain: arm.com, ip: 40.107.3.84, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/TxPcegNtqu5l0KO+oeMT2qfbaqgxprz7cTSxtEPQ=;
 b=h01w8rQCi32uxaDFcEUiGUzDoYlSAddhTmrcQfbACBb+Qy+716LuzfIisHCod/vO/ElpIejr6Z60AmVSvjtneX0eOfX8JT79QQ2RCJVY4FsSc41DWWJxGuMyvrLPKzG7QmjrK7ahqqEd0hh/auhRenjL3SLzj6SwrDTYvLmfPho=
Received: from AM5PR0101CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::48) by AM5PR0801MB1697.eurprd08.prod.outlook.com
 (2603:10a6:203:39::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 22 Jul
 2021 11:34:12 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::68) by AM5PR0101CA0035.outlook.office365.com
 (2603:10a6:206:16::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Thu, 22 Jul 2021 11:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 11:34:11 +0000
Received: ("Tessian outbound 57330d0f8f60:v99"); Thu, 22 Jul 2021 11:34:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffecc542096c2038
X-CR-MTA-TID: 64aa7808
Received: from 779c5032bffa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 22C64E0B-1527-419D-8CA0-E3B3A6C4638A.1;
	Thu, 22 Jul 2021 11:33:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 779c5032bffa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Jul 2021 11:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPNCdTBu2JUmGqlABB4jhyCnqKqwNEmwC5/KOGzd19/hmMk9Q1QSliCZA8l9ncXvumq9TDGTO5ncw1+THfQChqHClYlbpNIQJISWKN25o3RHvEHtczP5RnCCdFQ8m2tzvXG4KfeNeZgvEEiLnfE4fDIrJJM5Gnoqshke/GMQlt3qdKgWIs5l1IM7QtN4vKYSMTzrM2gwAMB2C4IWg7Hml6rhu2hk3huHFjRsK4ZtIqG2BFw8o73fTKvyW08PUbSylt4U1b/kz7z7MeHtR7L0SbGrA6ORCvDV0vgVpxd2fl53L19inMnaj01q1f6aWoge/iTSfxjENMZOEut64xV9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/TxPcegNtqu5l0KO+oeMT2qfbaqgxprz7cTSxtEPQ=;
 b=byxWye6TilLnrrCR/E5M84KIDqsGrwl9JE7b1T0urXQKJBoaBYeS9qEnjKbwmWfnCrNjt5uUfTWawAgdzjnpDZP/hdJhJbTgult+9o3R8NK27VGTHpIXsvb5wCnSscSEJ/cAq+ldiFX9oeIG4SG6YDmTOFEY5Mwx6uFXrnW+zuVayjL1nVrp9aEbfV/b9jKIm3ehf/46E2/OHqqZn6r6NVSoUEKZFOohOfYmPeaQ+9116MJGgmugZLbjyxBwpQsJk+CPNloMc41RwB4zyv8fxqDurYmsZ1iYDLFr1JITwuj2v/m2ilqLppVvcpKX45aSpNca3AQ5BDfQw3/EIBE+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/TxPcegNtqu5l0KO+oeMT2qfbaqgxprz7cTSxtEPQ=;
 b=h01w8rQCi32uxaDFcEUiGUzDoYlSAddhTmrcQfbACBb+Qy+716LuzfIisHCod/vO/ElpIejr6Z60AmVSvjtneX0eOfX8JT79QQ2RCJVY4FsSc41DWWJxGuMyvrLPKzG7QmjrK7ahqqEd0hh/auhRenjL3SLzj6SwrDTYvLmfPho=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 11:33:24 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:24 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Anders Dellien <anders.dellien@arm.com>,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 1/6] arm: update Android common kernel
Date: Thu, 22 Jul 2021 12:32:45 +0100
Message-ID: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
X-ClientProxiedBy: LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::13) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.53) by LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 11:33:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acd0454d-32e8-48e8-969d-08d94d04a094
X-MS-TrafficTypeDiagnostic: PA4PR08MB5950:|AM5PR0801MB1697:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1697902F7B9812AA1717C526FBE49@AM5PR0801MB1697.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: dAxUUpn39Xu0i9Wy2wMh+4qZ3hcTzmTZXrx591aycXh+LxNlzn8/8oZpTZk89JF5O84mgJ5dSYswNc/NwwGss3unZQNG59ktAy34K+QBIDDiORUjapUrf2U8rHG1gdzVOiRhTg3CMad9OhEOnsz3FeTJFY7+JBenFnf/XGiEokhFw3xabnOjlZHfKrw6AVmSPf8et8EZuiviGYEybylvOOiyfhBkjVHUrILUvcTMW8MvgaPE27mMtp2amaMdzCyMb2NZzTibEfAM4siv1ZqyO/9kyHIino7bgiGAlRO7x33mcu40bWpGt8kRVYiXQ4mweu7VH3/4x2q5fKqhlTquxiOgLB4aCRgRIra3gqBjRG/UEK49oesyOU7N9kYgm11Gc0kbT5CRj+WJPNI0e7OJ3LyTbGORA9P6aCj4N3zfBo4Klmw/DFMhVa7edQ0B9qRkJmgQX5F86KhsD0Ra2QzpYkzti8E10lziFQLQTZQK6OWRlbD0VraR2NjrMXEX3lTFfDh+8QmA61ZqNgSdtTZ4xUS9EBjtfcvZs/NGltTQlKZGVmiTjSxR4YEAcb9q53KcRfmPOr8ojN5nXinAbo6qlfUSom8WL/mWa6uaRdeqzuRLFcwjUgL7qNVhCFcI1uHStpIivP8v4FY8R0A29tkP3LivWgQINbQA+Zukkd+gz9AMCtXyAyPvqVeMjkf+GmzjIouaYmX9UQ/+BA+k1VwfMevJnw0x/7aOeVD5C0Cph600hiuBWHvMjuKHz/ld0KelFCFCIQU5mm3RXkvlBUL+IFlwoArmCcyLvPGFxPt4EdO65bGCLYWMV7RTMC9BBtGT
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(45080400002)(316002)(6486002)(966005)(8936002)(38100700002)(5660300002)(44832011)(186003)(36756003)(26005)(52116002)(6666004)(66946007)(66476007)(86362001)(54906003)(508600001)(4326008)(19627235002)(66556008)(8676002)(2906002)(66574015)(2616005)(83380400001)(30864003)(1076003)(15650500001)(38350700002)(956004)(7696005)(6916009)(559001)(569008)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VuYkUxeXpmYUJ3QUdtOTBsU1FhUTlSdjhiNnFUbjNIQXVicTJjRk5ManlU?=
 =?utf-8?B?THhpd2g3Vmoyc09Ta3dwekdqNmdiYXJVWG85dWhGcWJodklWWXZhSDJNU0lk?=
 =?utf-8?B?TWJkNVZhM2dIZ01TWEFubFJISXpxck9yczI3Vmd2Mzh1T0h0eGVkMDRzR0Iv?=
 =?utf-8?B?UGxHMzJWTmY1VzF4Y0FSenhjcnUvVlZWclpmQndMWTlOdEhrcGEvVjV4a05u?=
 =?utf-8?B?Yy9Hd0tzbEZENDZOS1BjdlFrOWwvSVlrLy9LNFpQbHpkR1dVd3RXTjNrbDBQ?=
 =?utf-8?B?NHFxWUpqaDg1SnIvYmpudVZXdHV2S2ZjTStVTVRYRGs2MUNnM0thK0V3VC9B?=
 =?utf-8?B?am5mQ3daNUdBMWVCbXlOR1h3QkkyaVBJUmU2YytHNWd6UGhiQ0N2djdCMWN0?=
 =?utf-8?B?TmZMTVVBUkZ5dGFHYVcvL3F5V3R5U2V0OGxKck9Dby8vOWY3bUJ3TnRhT0U0?=
 =?utf-8?B?bU9VZVUxYnBOZVVXRkpFbThsOGIxU21IOCt1NHBIUU1IVDBxbGpBRGxRMUNW?=
 =?utf-8?B?akxQWkpJZWRtalUyS3FMQ3RFY01NRHNmNS9LNXpqNng3SUtxS2o3U2ZqaGFI?=
 =?utf-8?B?RGY4c1REb1cyS1V4OE5CRWxVYkNzMzNnK00rVktMaklHd2ZFNVJlVVdvZ3Z4?=
 =?utf-8?B?V2VHQjFFQmN1c25GdHY3bDFVcUFoYm9UcjFVNFVEMm1XWWJIR2JQOUxoaFhV?=
 =?utf-8?B?S0tieGdSTzh6d1NQb2xlbFd0dWZ4ZTB5UEZEQ0FqVjNLckFGRlFWYXpVV3A3?=
 =?utf-8?B?NjhabysxZGtQRUdsbnp3RUJ1SFdmbnhkRmtKSnc4blEyQUtxd0dqYmU5b1Nx?=
 =?utf-8?B?ZVBqdm1JWFZFWWdxcGFDaGU1T1dXL0p0dTVFamk2R0tRVEZKejlXTFNWTDNX?=
 =?utf-8?B?WVRxQVNEN2VEekFJdXRLWEJiT2tHTEZBRnlZSUdzVHZBdWxmNTNyQzBucnFk?=
 =?utf-8?B?WGg1SDZWbjJuSVBIUXhNOWhYd0o1b3piaDVNdlllMVhYLzlqOFJWOHdhblpR?=
 =?utf-8?B?UlVaVjZ0dUVTM0Y0S3pKelUxem0wRllKZm1IQzUzRm5iS0JCNjZOYnR4cVRF?=
 =?utf-8?B?YXdqNEVsSjdwMUVPb3p4bjBIQzlySUpUWGM4UEp3aXdHVEpvT2YxZWc3ZzBR?=
 =?utf-8?B?ZWlKcVJwNStoSC9wRDhwZEllVmpIa2h6MGZTdzlQajNOcFhUWlBDNUFyUkI5?=
 =?utf-8?B?N2lOZ1l6WCt0MXZiZDFNb0tuUTNOUFdLTzljMGxqNlZQblN1OTR2RWRWUmQx?=
 =?utf-8?B?d2RvYkphaGxucXdOOUlPZFlLbVBid091R3VUblFDM0hEdm9TRUcvRmQyWjBW?=
 =?utf-8?B?Zk5WQ3RTQmpRUDRqUXk0RnVpbWZXZi9mRWNXUlBnM0NPc0ttd0IzR2hLUHdy?=
 =?utf-8?B?NzV6NUVFVE9adWtWdEtMZERVa1hOMDI4TzJrYTNyMXlQMGF2L2dQVUk2ZUNS?=
 =?utf-8?B?NkZabmhRSXlNd3gweEN3S2FSMW1HenQ3Z3RRdFR4d0ptT0JZcnN3WENId2FV?=
 =?utf-8?B?ajdPbFJ2UTBaQ2xHeW0xKzZXeVVyYUo2NDBubUtJVE84dzltbTE5elE4ckVI?=
 =?utf-8?B?ak9ETklqUnllY0w0MU5tK1l2c1oxNHdjYVVidTZXd05rQ2pzZnMxeWJjcVpP?=
 =?utf-8?B?MnJ2WCtnd0ZkcWd2Yys2alJRZ1JOc0hxSEhVN3hsaXZvcXBUeTNHQWZpREFa?=
 =?utf-8?B?cFpvc3UvMUo4d2hzT1lyTHF3ZVR6T2NpbEdBL0g3ckpIT2d4eklzalIySWxK?=
 =?utf-8?Q?dnTo9Ihzj3uaWaS0Y88KSlUcuockAUNri/FXQmC?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32511d4f-a2cf-4ee3-8eb6-08d94d0483d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EXM+VH6HxiMV2KfHAWTC7X6wOcAacifKs+BBrttRzMvxNiLtfvW54Qf4UIPWeAkXap6f5WjsmAykLpZZxWjRTr8R8ljcnNK9KbzD2LHFKQgQTCSA1RIOKuwxxTZpmYpzSJAVk93KumLVsO2OwYBAhE9jgnAv55qNbPrnWIQrLbv7vDlHfLoplRJzxeQ89R1SjCLJUHuLvNKIZXXVlP6PX9i4zEYrXBJIM2aNnIFy+ZXqdNbe/hWR+qm8WqJzcgtGWNKaUBeddf9odTl7u7tl8whkVULDDiiUlg01V2uD9NZE0vQLi0npxYJ8fSAB2Y1uACSctD77+3v/XHmp5HejPGxh7XsCSrA+amN+Vhh8VoH7EcnC1lhSy0yMlSUDKPkV6ubl9im3VCauSS9IR48NMKdk1YEgPoZF3RK16PmWQDC0iVDD5pRi+64gSlmMmKPiLgT1zPb9LqYNAtMn++mGSlZziWIZWqkWaVjN62uZkLirEahkwYE5w6nQ4K57lM7XXbeOh65DGtNfDIGTDHjDYan4lrCuH6XlBe1PjKJgpFKqJZdthvDRXLlXYHAQF2R+LtxFYRSZ/luo+Ia95OXX7k1Qb+UU2TJL3632o7uQaoBBPIsNcvIVX/iH0BNHGDP2nD6j4Alm3HXornR1AjYOsRc8brKvT2DGek50VBnYITO531FJPzvDo2WbNTSmtoVQdDMofq2+zirNxu4W0dTVMYpAOVV8I4RGqCqa9pdajgohZ8DchbyFI0rhSTQdaNcK6GIfHKxqvi9+3ZeW+GDiAB31uIOS5kQ/IXRQNnwZ2DK3lCTa2SLFpnYAFTaRZ2li
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(396003)(376002)(36840700001)(46966006)(66574015)(45080400002)(6916009)(356005)(1076003)(336012)(70586007)(956004)(30864003)(2906002)(26005)(82740400003)(81166007)(19627235002)(4326008)(86362001)(44832011)(36756003)(8676002)(5660300002)(15650500001)(966005)(6666004)(8936002)(478600001)(83380400001)(36860700001)(186003)(6486002)(7696005)(2616005)(54906003)(47076005)(316002)(82310400003)(70206006)(569008)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:34:11.7356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acd0454d-32e8-48e8-969d-08d94d04a094
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1697
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Anders Dellien <anders.dellien@arm.com>

Update ACK to 5.10 and remove the 5.4 recipe

Change-Id: I7a0cc0bc95d02bed965530d36aedaf544045fee4
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
---
 meta-arm-bsp/conf/machine/tc0.conf            |    2 +-
 .../linux/linux-arm-platforms.inc             |   19 +-
 ...m-Add-component-aware-simple-encoder.patch |   21 +-
 ...dd-RENDER-capability-to-the-device-n.patch |   13 +-
 ...Adapt-ION-interface-to-match-Android.patch |   33 +
 ...dings-mailbox-arm-mhuv2-Add-bindings.patch |  241 ++
 .../0005-mailbox-arm_mhuv2-Add-driver.patch   | 1256 +++++++
 ...ailbox-arm_mhuv2-Fix-sparse-warnings.patch |  114 +
 ...uv2-make-remove-callback-return-void.patch |   47 +
 ...2-Skip-calling-kfree-with-invalid-po.patch |   41 +
 .../tc0/defconfig                             |   85 +-
 ...2-add-device-tree-binding-documentat.patch |  134 -
 ...ilbox-arm_mhuv2-add-arm-mhuv2-driver.patch |  822 -----
 ...2-add-doorbell-transport-protocol-op.patch |  156 -
 ...2-add-multi-word-transport-protocol-.patch |  271 --
 ...rm_scmi-Add-fast_switch_possible-api.patch |   67 -
 ...-Set-fast_switch_possible-conditiona.patch |   42 -
 ...Initial-version-of-ffa-driver-based-.patch | 1461 --------
 ...for-session-s-client-UUID-generation.patch |  252 --
 ...pport-for-session-login-client-UUID-.patch |   43 -
 ...iver-optee-Support-for-ffa-transport.patch | 3150 -----------------
 ...m-handle-removal-in-ffa_shm_unregist.patch |   51 -
 ...t-for-asymmetric-AArch32-EL0-configu.patch |  462 ---
 ...t-hotplugging-the-last-AArch32-able-.patch |   89 -
 ...bbappend =3D> linux-arm64-ack_5.10.bbappend} |    0
 .../recipes-kernel/linux/linux-arm64-ack.inc  |    4 +-
 ...-definition-of-traceid_list-global-v.patch |   69 -
 ..._account-Make-global-variable-static.patch |   43 -
 ...-some-global-variables-to-fix-build-.patch |  240 --
 ...ceevent-Fix-build-with-binutils-2.35.patch |   39 -
 .../linux/linux-arm64-ack_5.10.bb             |   12 +
 .../linux/linux-arm64-ack_5.4.bb              |   16 -
 32 files changed, 1801 insertions(+), 7494 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.4 =3D> linux-a=
rm64-ack-5.10}/tc0/0001-drm-Add-component-aware-simple-encoder.patch (94%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.4 =3D> linux-a=
rm64-ack-5.10}/tc0/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-=
n.patch (68%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0003-Adapt-ION-interface-to-match-Android.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0005-mailbox-arm_mhuv2-Add-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc0/0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.4 =3D> linux-a=
rm64-ack-5.10}/tc0/defconfig (95%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0003-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0005-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0009-driver-firmware-Initial-version-of-ffa-driver-based-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0010-tee-add-support-for-session-s-client-UUID-generation.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0011-tee-optee-Add-support-for-session-login-client-UUID-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0012-driver-optee-Support-for-ffa-transport.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0013-tee-optee-fix-mem-handle-removal-in-ffa_shm_unregist.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0014-arm64-Add-support-for-asymmetric-AArch32-EL0-configu.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0015-arm64-smp-Prevent-hotplugging-the-last-AArch32-able-.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack_5.4.bbappend =3D=
> linux-arm64-ack_5.10.bbappend} (100%)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-perf=
-cs-etm-Move-definition-of-traceid_list-global-v.patch
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0002-perf=
-tests-bp_account-Make-global-variable-static.patch
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0003-perf=
-bench-Share-some-global-variables-to-fix-build-.patch
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack/0004-libt=
raceevent-Fix-build-with-binutils-2.35.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb

diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine=
/tc0.conf
index a83fd28..565afda 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -30,7 +30,7 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trust=
ed-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
-PREFERRED_VERSION_linux-arm64-ack ?=3D "5.4"
+PREFERRED_VERSION_linux-arm64-ack ?=3D "5.10"
=20
 # Cannot use the default zImage on arm64
 KERNEL_IMAGETYPE =3D "Image"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 5c361f7..0a679da 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -79,19 +79,12 @@ SRC_URI_append_tc0 =3D " \
     file://defconfig \
     file://0001-drm-Add-component-aware-simple-encoder.patch \
     file://0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch=
 \
-    file://0003-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch=
 \
-    file://0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch \
-    file://0005-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch=
 \
-    file://0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch=
 \
-    file://0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch \
-    file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch=
 \
-    file://0009-driver-firmware-Initial-version-of-ffa-driver-based-.patch=
 \
-    file://0010-tee-add-support-for-session-s-client-UUID-generation.patch=
 \
-    file://0011-tee-optee-Add-support-for-session-login-client-UUID-.patch=
 \
-    file://0012-driver-optee-Support-for-ffa-transport.patch \
-    file://0013-tee-optee-fix-mem-handle-removal-in-ffa_shm_unregist.patch=
 \
-    file://0014-arm64-Add-support-for-asymmetric-AArch32-EL0-configu.patch=
 \
-    file://0015-arm64-smp-Prevent-hotplugging-the-last-AArch32-able-.patch=
 \
+    file://0003-Adapt-ION-interface-to-match-Android.patch \
+    file://0004-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch \
+    file://0005-mailbox-arm_mhuv2-Add-driver.patch \
+    file://0006-mailbox-arm_mhuv2-Fix-sparse-warnings.patch \
+    file://0007-mailbox-arm_mhuv2-make-remove-callback-return-void.patch \
+    file://0008-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch=
 \
     "
=20
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0001=
-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.10/tc0/0001-drm-Add-component-aware-simple-encoder=
.patch
similarity index 94%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0001-=
drm-Add-component-aware-simple-encoder.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0001-d=
rm-Add-component-aware-simple-encoder.patch
index 7855bee..b698ec7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0001-drm-Ad=
d-component-aware-simple-encoder.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0001-drm-A=
dd-component-aware-simple-encoder.patch
@@ -1,7 +1,7 @@
-From 7863ac1515009547bae3a66e0808e72b3bdcf8c8 Mon Sep 17 00:00:00 2001
+From 9080fb7fc011445d4d6ee164d02d86ff6df0822a Mon Sep 17 00:00:00 2001
 From: Tushar Khandelwal <tushar.khandelwal@arm.com>
 Date: Tue, 16 Jun 2020 12:39:06 +0000
-Subject: [PATCH 1/9] drm: Add component-aware simple encoder
+Subject: [PATCH 01/10] drm: Add component-aware simple encoder
=20
 This is a simple DRM encoder that gets its connector timings information
 from a OF subnode in the device tree and exposes that as a "discovered"
@@ -12,6 +12,7 @@ and the display output is configured outside the kernel.
 Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
=20
 Upstream-Status: Backport [https://git.linaro.org/landing-teams/working/ar=
m/kernel-release.git/commit/?h=3Dlatest-armlt&id=3D15283f7be4b1e586702551e8=
5b4caf06531ac2fc]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 ---
  drivers/gpu/drm/Kconfig               |  11 +
  drivers/gpu/drm/Makefile              |   2 +
@@ -20,10 +21,10 @@ Upstream-Status: Backport [https://git.linaro.org/landi=
ng-teams/working/arm/kern
  create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
=20
 diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
-index e67c194c2aca..c95279cd9341 100644
+index ca868271f4c4..6ae8ba3ca7b3 100644
 --- a/drivers/gpu/drm/Kconfig
 +++ b/drivers/gpu/drm/Kconfig
-@@ -265,6 +265,17 @@ config DRM_VKMS
+@@ -300,6 +300,17 @@ config DRM_VKMS
 =20
  	  If M is selected the module will be called vkms.
 =20
@@ -38,14 +39,14 @@ index e67c194c2aca..c95279cd9341 100644
 +         drm_vencoder.
 +
 +
- config DRM_ATI_PCIGART
-         bool
+ source "drivers/gpu/drm/exynos/Kconfig"
 =20
+ source "drivers/gpu/drm/rockchip/Kconfig"
 diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
-index 82ff826b33cc..d2ab6fc64932 100644
+index 81569009f884..a3429152c613 100644
 --- a/drivers/gpu/drm/Makefile
 +++ b/drivers/gpu/drm/Makefile
-@@ -53,6 +53,8 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) +=3D drm_dp_cec.o
+@@ -56,6 +56,8 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) +=3D drm_dp_cec.o
 =20
  obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
  obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D selftests/
@@ -56,7 +57,7 @@ index 82ff826b33cc..d2ab6fc64932 100644
  obj-$(CONFIG_DRM_MIPI_DBI) +=3D drm_mipi_dbi.o
 diff --git a/drivers/gpu/drm/drm_virtual_encoder.c b/drivers/gpu/drm/drm_v=
irtual_encoder.c
 new file mode 100644
-index 000000000000..4fd2098df286
+index 000000000000..2f65c6b47d00
 --- /dev/null
 +++ b/drivers/gpu/drm/drm_virtual_encoder.c
 @@ -0,0 +1,299 @@
@@ -250,7 +251,7 @@ index 000000000000..4fd2098df286
 +		crtcs =3D drm_of_find_possible_crtcs(drm, dev->of_node);
 +		bridge =3D of_drm_find_bridge(dev->of_node);
 +		if (bridge) {
-+			ret =3D drm_bridge_attach(encoder, bridge, NULL);
++			ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
 +			if (ret) {
 +				DRM_ERROR("Failed to initialize bridge\n");
 +				return ret;
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0002=
-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0002-drm-arm-komeda-add-RENDE=
R-capability-to-the-device-n.patch
similarity index 68%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0002-=
drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0002-d=
rm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
index 412e982..c3febff 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0002-drm-ar=
m-komeda-add-RENDER-capability-to-the-device-n.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0002-drm-a=
rm-komeda-add-RENDER-capability-to-the-device-n.patch
@@ -1,7 +1,7 @@
-From 190c6354a0d80c31214550553cfbee25571e1942 Mon Sep 17 00:00:00 2001
+From 7a0e6189c7b104a679bc7b91465425e2de909456 Mon Sep 17 00:00:00 2001
 From: Tushar Khandelwal <tushar.khandelwal@arm.com>
 Date: Wed, 17 Jun 2020 10:49:26 +0000
-Subject: [PATCH 2/9] drm: arm: komeda: add RENDER capability to the device
+Subject: [PATCH 02/10] drm: arm: komeda: add RENDER capability to the devi=
ce
  node
=20
 this is required to make this driver work with android framework
@@ -9,23 +9,24 @@ this is required to make this driver work with android fr=
amework
 Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
=20
 Upstream-Status: Inappropriate [Product specific configuration]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 ---
  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu=
/drm/arm/display/komeda/komeda_kms.c
-index ae274902ff92..238bd8466206 100644
+index 1f6682032ca4..9d1a1942e673 100644
 --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
 +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
-@@ -56,7 +56,7 @@ static irqreturn_t komeda_kms_irq_handler(int irq, void =
*data)
+@@ -59,7 +59,7 @@ static irqreturn_t komeda_kms_irq_handler(int irq, void =
*data)
  }
 =20
  static struct drm_driver komeda_kms_driver =3D {
 -	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 +	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC | DRIVE=
R_RENDER,
  	.lastclose			=3D drm_fb_helper_lastclose,
- 	.gem_free_object_unlocked	=3D drm_gem_cma_free_object,
- 	.gem_vm_ops			=3D &drm_gem_cma_vm_ops,
+ 	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(komeda_gem_cma_dumb_create),
+ 	.fops =3D &komeda_cma_fops,
 --=20
 2.17.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/000=
3-Adapt-ION-interface-to-match-Android.patch b/meta-arm-bsp/recipes-kernel/=
linux/linux-arm64-ack-5.10/tc0/0003-Adapt-ION-interface-to-match-Android.pa=
tch
new file mode 100644
index 0000000..1d6a403
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0003-Adapt=
-ION-interface-to-match-Android.patch
@@ -0,0 +1,33 @@
+From b98c6070320ad31318a028482f026d6a5eddce5b Mon Sep 17 00:00:00 2001
+From: Anders Dellien <anders.dellien@arm.com>
+Date: Fri, 29 Jan 2021 09:44:38 +0000
+Subject: [PATCH 03/10] Adapt ION interface to match Android
+
+Change-Id: I62b69cc357868f725170899c862530b8f3069666
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+
+Upstream-Status: Inappropriate [Product specific configuration]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ include/uapi/linux/ion.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/include/uapi/linux/ion.h b/include/uapi/linux/ion.h
+index 371e44662755..7022ea223736 100644
+--- a/include/uapi/linux/ion.h
++++ b/include/uapi/linux/ion.h
+@@ -24,7 +24,10 @@
+  */
+ enum ion_heap_type {
+ 	ION_HEAP_TYPE_SYSTEM =3D 0,
+-	ION_HEAP_TYPE_DMA =3D 2,
++       ION_HEAP_TYPE_SYSTEM_CONTIG =3D 1,
++       ION_HEAP_TYPE_CARVEOUT =3D 2,
++       ION_HEAP_TYPE_CHUNK =3D 3,
++       ION_HEAP_TYPE_DMA =3D 4,
+ 	/* reserved range for future standard heap types */
+ 	ION_HEAP_TYPE_CUSTOM =3D 16,
+ 	ION_HEAP_TYPE_MAX =3D 31,
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/000=
4-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-arm64-ack-5.10/tc0/0004-dt-bindings-mailbox-arm-mhuv2-Add=
-bindings.patch
new file mode 100644
index 0000000..be5801a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0004-dt-bi=
ndings-mailbox-arm-mhuv2-Add-bindings.patch
@@ -0,0 +1,241 @@
+From 4cafac5cd54c7f5069a4d6e17bdbd8f94cd5fa0b Mon Sep 17 00:00:00 2001
+From: Viresh Kumar <viresh.kumar@linaro.org>
+Date: Tue, 17 Nov 2020 15:32:05 +0530
+Subject: [PATCH 04/10] dt-bindings: mailbox : arm,mhuv2: Add bindings
+
+This patch adds device tree binding for ARM Message Handling Unit (MHU)
+controller version 2.
+
+Based on earlier work by Morten Borup Petersen.
+
+Reviewed-by: Rob Herring <robh@kernel.org>
+Co-developed-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
+Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
+
+Upstream-Status: Backport [https://lkml.org/lkml/2020/11/17/234]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ .../bindings/mailbox/arm,mhuv2.yaml           | 209 ++++++++++++++++++
+ 1 file changed, 209 insertions(+)
+ create mode 100644 Documentation/devicetree/bindings/mailbox/arm,mhuv2.ya=
ml
+
+diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml b/Do=
cumentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
+new file mode 100644
+index 000000000000..6608545ea66f
+--- /dev/null
++++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
+@@ -0,0 +1,209 @@
++# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
++%YAML 1.2
++---
++$id: http://devicetree.org/schemas/mailbox/arm,mhuv2.yaml#
++$schema: http://devicetree.org/meta-schemas/core.yaml#
++
++title: ARM MHUv2 Mailbox Controller
++
++maintainers:
++  - Tushar Khandelwal <tushar.khandelwal@arm.com>
++  - Viresh Kumar <viresh.kumar@linaro.org>
++
++description: |
++  The Arm Message Handling Unit (MHU) Version 2 is a mailbox controller t=
hat has
++  between 1 and 124 channel windows (each 32-bit wide) to provide unidire=
ctional
++  communication with remote processor(s), where the number of channel win=
dows
++  are implementation dependent.
++
++  Given the unidirectional nature of the controller, an MHUv2 mailbox may=
 only
++  be written to or read from. If a pair of MHU controllers is implemented
++  between two processing elements to provide bidirectional communication,=
 these
++  must be specified as two separate mailboxes.
++
++  If the interrupts property is present in device tree node, then its tre=
ated as
++  a "receiver" mailbox, otherwise a "sender".
++
++  An MHU controller must be specified along with the supported transport
++  protocols. The transport protocols determine the method of data transmi=
ssion
++  as well as the number of provided mailbox channels.
++
++  Following are the possible transport protocols.
++
++  - Data-transfer: Each transfer is made of one or more words, using one =
or more
++    channel windows.
++
++  - Doorbell: Each transfer is made up of single bit flag, using any one =
of the
++    bits in a channel window. A channel window can support up to 32 doorb=
ells
++    and the entire window shall be used in doorbell protocol.  Optionally=
, data
++    may be transmitted through a shared memory region, wherein the MHU is=
 used
++    strictly as an interrupt generation mechanism but that is out of the =
scope
++    of these bindings.
++
++# We need a select here so we don't match all nodes with 'arm,primecell'
++select:
++  properties:
++    compatible:
++      contains:
++        enum:
++          - arm,mhuv2-tx
++          - arm,mhuv2-rx
++  required:
++    - compatible
++
++properties:
++  compatible:
++    oneOf:
++      - description: Sender mode
++        items:
++          - const: arm,mhuv2-tx
++          - const: arm,primecell
++
++      - description: Receiver-mode
++        items:
++          - const: arm,mhuv2-rx
++          - const: arm,primecell
++
++  reg:
++    maxItems: 1
++
++  interrupts:
++    description: |
++      The MHUv2 controller always implements an interrupt in the "receive=
r"
++      mode, while the interrupt in the "sender" mode was not available in=
 the
++      version MHUv2.0, but the later versions do have it.
++    maxItems: 1
++
++  clocks:
++    maxItems: 1
++
++  clock-names:
++    maxItems: 1
++
++  arm,mhuv2-protocols:
++    $ref: /schemas/types.yaml#/definitions/uint32-matrix
++    description: |
++      The MHUv2 controller may contain up to 124 channel windows (each 32=
-bit
++      wide). The hardware and the DT bindings allows any combination of t=
hose to
++      be used for various transport protocols.
++
++      This property allows a platform to describe how these channel windo=
ws are
++      used in various transport protocols. The entries in this property s=
hall be
++      present as an array of tuples, where each tuple describes details a=
bout
++      one of the transport protocol being implemented over some channel
++      window(s).
++
++      The first field of a tuple signifies the transfer protocol, 0 is re=
served
++      for doorbell protocol, and 1 is reserved for data-transfer protocol=
.
++      Using any other value in the first field of a tuple makes it invali=
d.
++
++      The second field of a tuple signifies the number of channel windows=
 where
++      the protocol would be used and should be set to a non zero value. F=
or
++      doorbell protocol this field signifies the number of 32-bit channel
++      windows that implement the doorbell protocol. For data-transfer pro=
tocol,
++      this field signifies the number of 32-bit channel windows that impl=
ement
++      the data-transfer protocol.
++
++      The total number of channel windows specified here shouldn't be mor=
e than
++      the ones implemented by the platform, though one can specify lesser=
 number
++      of windows here than what the platform implements.
++
++      mhu: mailbox@2b1f0000 {
++          ...
++
++          arm,mhuv2-protocols =3D <0 2>, <1 1>, <1 5>, <1 7>;
++      }
++
++      The above example defines the protocols of an ARM MHUv2 mailbox
++      controller, where a total of 15 channel windows are used. The first=
 two
++      windows are used in doorbell protocol (64 doorbells), followed by 1=
, 5 and
++      7 windows (separately) used in data-transfer protocol.
++
++    minItems: 1
++    maxItems: 124
++    items:
++      items:
++        - enum: [ 0, 1 ]
++        - minimum: 0
++          maximum: 124
++
++
++  '#mbox-cells':
++    description: |
++      It is always set to 2. The first argument in the consumers 'mboxes'
++      property represents the channel window group, which may be used in
++      doorbell, or data-transfer protocol, and the second argument (only
++      relevant in doorbell protocol, should be 0 otherwise) represents th=
e
++      doorbell number within the 32 bit wide channel window.
++
++      From the example given above for arm,mhuv2-protocols, here is how a=
 client
++      node can reference them.
++
++      mboxes =3D <&mhu 0 5>; // Channel Window Group 0, doorbell 5.
++      mboxes =3D <&mhu 1 7>; // Channel Window Group 1, doorbell 7.
++      mboxes =3D <&mhu 2 0>; // Channel Window Group 2, data transfer pro=
tocol with 1 window.
++      mboxes =3D <&mhu 3 0>; // Channel Window Group 3, data transfer pro=
tocol with 5 windows.
++      mboxes =3D <&mhu 4 0>; // Channel Window Group 4, data transfer pro=
tocol with 7 windows.
++
++    const: 2
++
++if:
++  # Interrupt is compulsory for receiver
++  properties:
++    compatible:
++      contains:
++        const: arm,mhuv2-rx
++then:
++  required:
++    - interrupts
++
++required:
++  - compatible
++  - reg
++  - '#mbox-cells'
++  - arm,mhuv2-protocols
++
++additionalProperties: false
++
++examples:
++  # Multiple transport protocols implemented by the mailbox controllers
++  - |
++    soc {
++        #address-cells =3D <2>;
++        #size-cells =3D <2>;
++
++        mhu_tx: mailbox@2b1f0000 {
++            #mbox-cells =3D <2>;
++            compatible =3D "arm,mhuv2-tx", "arm,primecell";
++            reg =3D <0 0x2b1f0000 0 0x1000>;
++            clocks =3D <&clock 0>;
++            clock-names =3D "apb_pclk";
++            interrupts =3D <0 45 4>;
++            arm,mhuv2-protocols =3D <1 5>, <1 2>, <1 5>, <1 7>, <0 2>;
++        };
++
++        mhu_rx: mailbox@2b1f1000 {
++            #mbox-cells =3D <2>;
++            compatible =3D "arm,mhuv2-rx", "arm,primecell";
++            reg =3D <0 0x2b1f1000 0 0x1000>;
++            clocks =3D <&clock 0>;
++            clock-names =3D "apb_pclk";
++            interrupts =3D <0 46 4>;
++            arm,mhuv2-protocols =3D <1 1>, <1 7>, <0 2>;
++        };
++
++        mhu_client: scb@2e000000 {
++            compatible =3D "fujitsu,mb86s70-scb-1.0";
++            reg =3D <0 0x2e000000 0 0x4000>;
++
++            mboxes =3D
++                     //data-transfer protocol with 5 windows, mhu-tx
++                     <&mhu_tx 2 0>,
++                     //data-transfer protocol with 7 windows, mhu-tx
++                     <&mhu_tx 3 0>,
++                     //doorbell protocol channel 4, doorbell 27, mhu-tx
++                     <&mhu_tx 4 27>,
++                     //data-transfer protocol with 1 window, mhu-rx
++                     <&mhu_rx 0 0>;
++        };
++    };
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/000=
5-mailbox-arm_mhuv2-Add-driver.patch b/meta-arm-bsp/recipes-kernel/linux/li=
nux-arm64-ack-5.10/tc0/0005-mailbox-arm_mhuv2-Add-driver.patch
new file mode 100644
index 0000000..f3f90ed
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0005-mailb=
ox-arm_mhuv2-Add-driver.patch
@@ -0,0 +1,1256 @@
+From 51f0bb9cf8e8fca22b040d89e7be802c5ea0cf16 Mon Sep 17 00:00:00 2001
+From: Viresh Kumar <viresh.kumar@linaro.org>
+Date: Tue, 17 Nov 2020 15:32:06 +0530
+Subject: [PATCH 05/10] mailbox: arm_mhuv2: Add driver
+
+This adds driver for the ARM MHUv2 (Message Handling Unit) mailbox
+controller.
+
+This is based on the accepted DT bindings of the controller and supports
+combination of both transport protocols, i.e. doorbell and data-transfer.
+
+Transmitting and receiving data through the mailbox framework is done
+through struct arm_mhuv2_mbox_msg.
+
+Based on the initial work done by Morten Borup Petersen from ARM.
+
+Co-developed-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Tested-by: Usama Arif <usama.arif@arm.com>
+Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
+Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
+
+Upstream-Status: Backport [https://www.lkml.org/lkml/2020/11/17/235]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ MAINTAINERS                               |    9 +
+ drivers/mailbox/Kconfig                   |    7 +
+ drivers/mailbox/Makefile                  |    2 +
+ drivers/mailbox/arm_mhuv2.c               | 1136 +++++++++++++++++++++
+ include/linux/mailbox/arm_mhuv2_message.h |   20 +
+ 5 files changed, 1174 insertions(+)
+ create mode 100644 drivers/mailbox/arm_mhuv2.c
+ create mode 100644 include/linux/mailbox/arm_mhuv2_message.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index db2a3dfb063d..389f356aed5d 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -10458,6 +10458,15 @@ F:	drivers/mailbox/
+ F:	include/linux/mailbox_client.h
+ F:	include/linux/mailbox_controller.h
+=20
++MAILBOX ARM MHUv2
++M:	Viresh Kumar <viresh.kumar@linaro.org>
++M:	Tushar Khandelwal <Tushar.Khandelwal@arm.com>
++L:	linux-kernel@vger.kernel.org
++S:	Maintained
++F:	drivers/mailbox/arm_mhuv2.c
++F:	include/linux/mailbox/arm_mhuv2_message.h
++F:	Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
++
+ MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
+ M:	Michael Kerrisk <mtk.manpages@gmail.com>
+ L:	linux-man@vger.kernel.org
+diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
+index 05b1009e2820..3c0ea96a0a8b 100644
+--- a/drivers/mailbox/Kconfig
++++ b/drivers/mailbox/Kconfig
+@@ -16,6 +16,13 @@ config ARM_MHU
+ 	  The controller has 3 mailbox channels, the last of which can be
+ 	  used in Secure mode only.
+=20
++config ARM_MHU_V2
++	tristate "ARM MHUv2 Mailbox"
++	depends on ARM_AMBA
++	help
++	  Say Y here if you want to build the ARM MHUv2 controller driver,
++	  which provides unidirectional mailboxes between processing elements.
++
+ config IMX_MBOX
+ 	tristate "i.MX Mailbox"
+ 	depends on ARCH_MXC || COMPILE_TEST
+diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
+index 2e06e02b2e03..7194fa92c787 100644
+--- a/drivers/mailbox/Makefile
++++ b/drivers/mailbox/Makefile
+@@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
+=20
+ obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o arm_mhu_db.o
+=20
++obj-$(CONFIG_ARM_MHU_V2)	+=3D arm_mhuv2.o
++
+ obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
+=20
+ obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+=3D armada-37xx-rwtm-mailbox.o
+diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
+new file mode 100644
+index 000000000000..67fb10885bb4
+--- /dev/null
++++ b/drivers/mailbox/arm_mhuv2.c
+@@ -0,0 +1,1136 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * ARM Message Handling Unit Version 2 (MHUv2) driver.
++ *
++ * Copyright (C) 2020 ARM Ltd.
++ * Copyright (C) 2020 Linaro Ltd.
++ *
++ * An MHUv2 mailbox controller can provide up to 124 channel windows (eac=
h 32
++ * bit long) and the driver allows any combination of both the transport
++ * protocol modes: data-transfer and doorbell, to be used on those channe=
l
++ * windows.
++ *
++ * The transport protocols should be specified in the device tree entry f=
or the
++ * device. The transport protocols determine how the underlying hardware
++ * resources of the device are utilized when transmitting data. Refer to =
the
++ * device tree bindings of the ARM MHUv2 controller for more details.
++ *
++ * The number of registered mailbox channels is dependent on both the und=
erlying
++ * hardware - mainly the number of channel windows implemented by the pla=
tform,
++ * as well as the selected transport protocols.
++ *
++ * The MHUv2 controller can work both as a sender and receiver, but the d=
river
++ * and the DT bindings support unidirectional transfers for better alloca=
tion of
++ * the channels. That is, this driver will be probed for two separate dev=
ices
++ * for each mailbox controller, a sender device and a receiver device.
++ */
++
++#include <linux/amba/bus.h>
++#include <linux/interrupt.h>
++#include <linux/mailbox_controller.h>
++#include <linux/mailbox/arm_mhuv2_message.h>
++#include <linux/module.h>
++#include <linux/of_address.h>
++#include <linux/spinlock.h>
++
++/* =3D=3D=3D=3D=3D=3D MHUv2 Registers =3D=3D=3D=3D=3D=3D */
++
++/* Maximum number of channel windows */
++#define MHUV2_CH_WN_MAX			124
++/* Number of combined interrupt status registers */
++#define MHUV2_CMB_INT_ST_REG_CNT	4
++#define MHUV2_STAT_BYTES		(sizeof(u32))
++#define MHUV2_STAT_BITS			(MHUV2_STAT_BYTES * __CHAR_BIT__)
++
++#define LSB_MASK(n)			((1 << (n * __CHAR_BIT__)) - 1)
++#define MHUV2_PROTOCOL_PROP		"arm,mhuv2-protocols"
++
++/* Register Message Handling Unit Configuration fields */
++struct mhu_cfg_t {
++	u32 num_ch : 7;
++	u32 pad : 25;
++} __packed;
++
++/* register Interrupt Status fields */
++struct int_st_t {
++	u32 nr2r : 1;
++	u32 r2nr : 1;
++	u32 pad : 30;
++} __packed;
++
++/* Register Interrupt Clear fields */
++struct int_clr_t {
++	u32 nr2r : 1;
++	u32 r2nr : 1;
++	u32 pad : 30;
++} __packed;
++
++/* Register Interrupt Enable fields */
++struct int_en_t {
++	u32 r2nr : 1;
++	u32 nr2r : 1;
++	u32 chcomb : 1;
++	u32 pad : 29;
++} __packed;
++
++/* Register Implementer Identification fields */
++struct iidr_t {
++	u32 implementer : 12;
++	u32 revision : 4;
++	u32 variant : 4;
++	u32 product_id : 12;
++} __packed;
++
++/* Register Architecture Identification Register fields */
++struct aidr_t {
++	u32 arch_minor_rev : 4;
++	u32 arch_major_rev : 4;
++	u32 pad : 24;
++} __packed;
++
++/* Sender Channel Window fields */
++struct mhu2_send_ch_wn_reg {
++	u32 stat;
++	u8 pad1[0x0C - 0x04];
++	u32 stat_set;
++	u32 int_st;
++	u32 int_clr;
++	u32 int_en;
++	u8 pad2[0x20 - 0x1C];
++} __packed;
++
++/* Sender frame register fields */
++struct mhu2_send_frame_reg {
++	struct mhu2_send_ch_wn_reg ch_wn[MHUV2_CH_WN_MAX];
++	struct mhu_cfg_t mhu_cfg;
++	u32 resp_cfg;
++	u32 access_request;
++	u32 access_ready;
++	struct int_st_t int_st;
++	struct int_clr_t int_clr;
++	struct int_en_t int_en;
++	u32 reserved0;
++	u32 chcomb_int_st[MHUV2_CMB_INT_ST_REG_CNT];
++	u8 pad[0xFC8 - 0xFB0];
++	struct iidr_t iidr;
++	struct aidr_t aidr;
++} __packed;
++
++/* Receiver Channel Window fields */
++struct mhu2_recv_ch_wn_reg {
++	u32 stat;
++	u32 stat_masked;
++	u32 stat_clear;
++	u8 reserved0[0x10 - 0x0C];
++	u32 mask;
++	u32 mask_set;
++	u32 mask_clear;
++	u8 pad[0x20 - 0x1C];
++} __packed;
++
++/* Receiver frame register fields */
++struct mhu2_recv_frame_reg {
++	struct mhu2_recv_ch_wn_reg ch_wn[MHUV2_CH_WN_MAX];
++	struct mhu_cfg_t mhu_cfg;
++	u8 reserved0[0xF90 - 0xF84];
++	struct int_st_t int_st;
++	struct int_clr_t int_clr;
++	struct int_en_t int_en;
++	u32 pad;
++	u32 chcomb_int_st[MHUV2_CMB_INT_ST_REG_CNT];
++	u8 reserved2[0xFC8 - 0xFB0];
++	struct iidr_t iidr;
++	struct aidr_t aidr;
++} __packed;
++
++
++/* =3D=3D=3D=3D=3D=3D MHUv2 data structures =3D=3D=3D=3D=3D=3D */
++
++enum mhuv2_transport_protocol {
++	DOORBELL =3D 0,
++	DATA_TRANSFER =3D 1
++};
++
++enum mhuv2_frame {
++	RECEIVER_FRAME,
++	SENDER_FRAME
++};
++
++/**
++ * struct mhuv2 - MHUv2 mailbox controller data
++ *
++ * @mbox:	Mailbox controller belonging to the MHU frame.
++ * @send/recv:	Base address of the register mapping region.
++ * @frame:	Frame type: RECEIVER_FRAME or SENDER_FRAME.
++ * @irq:	Interrupt.
++ * @windows:	Channel windows implemented by the platform.
++ * @minor:	Minor version of the controller.
++ * @length:	Length of the protocols array in bytes.
++ * @protocols:	Raw protocol information, derived from device tree.
++ * @doorbell_pending_lock: spinlock required for correct operation of Tx
++ *		interrupt for doorbells.
++ */
++struct mhuv2 {
++	struct mbox_controller mbox;
++	union {
++		struct mhu2_send_frame_reg __iomem *send;
++		struct mhu2_recv_frame_reg __iomem *recv;
++	};
++	enum mhuv2_frame frame;
++	unsigned int irq;
++	unsigned int windows;
++	unsigned int minor;
++	unsigned int length;
++	u32 *protocols;
++
++	spinlock_t doorbell_pending_lock;
++};
++
++#define mhu_from_mbox(_mbox) container_of(_mbox, struct mhuv2, mbox)
++
++/**
++ * struct mhuv2_protocol_ops - MHUv2 operations
++ *
++ * Each transport protocol must provide an implementation of the operatio=
ns
++ * provided here.
++ *
++ * @rx_startup: Startup callback for receiver.
++ * @rx_shutdown: Shutdown callback for receiver.
++ * @read_data: Reads and clears newly available data.
++ * @tx_startup: Startup callback for receiver.
++ * @tx_shutdown: Shutdown callback for receiver.
++ * @last_tx_done: Report back if the last tx is completed or not.
++ * @send_data: Send data to the receiver.
++ */
++struct mhuv2_protocol_ops {
++	int (*rx_startup)(struct mhuv2 *mhu, struct mbox_chan *chan);
++	void (*rx_shutdown)(struct mhuv2 *mhu, struct mbox_chan *chan);
++	void *(*read_data)(struct mhuv2 *mhu, struct mbox_chan *chan);
++
++	void (*tx_startup)(struct mhuv2 *mhu, struct mbox_chan *chan);
++	void (*tx_shutdown)(struct mhuv2 *mhu, struct mbox_chan *chan);
++	int (*last_tx_done)(struct mhuv2 *mhu, struct mbox_chan *chan);
++	int (*send_data)(struct mhuv2 *mhu, struct mbox_chan *chan, void *arg);
++};
++
++/*
++ * MHUv2 mailbox channel's private information
++ *
++ * @ops:	protocol specific ops for the channel.
++ * @ch_wn_idx:	Channel window index allocated to the channel.
++ * @windows:	Total number of windows consumed by the channel, only releva=
nt
++ *		in DATA_TRANSFER protocol.
++ * @doorbell:	Doorbell bit number within the ch_wn_idx window, only relev=
ant
++ *		in DOORBELL protocol.
++ * @pending:	Flag indicating pending doorbell interrupt, only relevant in
++ *		DOORBELL protocol.
++ */
++struct mhuv2_mbox_chan_priv {
++	const struct mhuv2_protocol_ops *ops;
++	u32 ch_wn_idx;
++	union {
++		u32 windows;
++		struct {
++			u32 doorbell;
++			u32 pending;
++		};
++	};
++};
++
++/* Macro for reading a bitfield within a physically mapped packed struct =
*/
++#define readl_relaxed_bitfield(_regptr, _field)				\
++	({								\
++		u32 _regval;						\
++		_regval =3D readl_relaxed((_regptr));			\
++		(*(typeof((_regptr)))(&_regval))._field;		\
++	})
++
++/* Macro for writing a bitfield within a physically mapped packed struct =
*/
++#define writel_relaxed_bitfield(_value, _regptr, _field)		\
++	({								\
++		u32 _regval;						\
++		_regval =3D readl_relaxed(_regptr);			\
++		(*(typeof(_regptr))(&_regval))._field =3D _value;		\
++		writel_relaxed(_regval, _regptr);			\
++	})
++
++
++/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Doorbell tra=
nsport protocol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
++
++static int mhuv2_doorbell_rx_startup(struct mhuv2 *mhu, struct mbox_chan =
*chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	writel_relaxed(BIT(priv->doorbell),
++		       &mhu->recv->ch_wn[priv->ch_wn_idx].mask_clear);
++	return 0;
++}
++
++static void mhuv2_doorbell_rx_shutdown(struct mhuv2 *mhu,
++				       struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	writel_relaxed(BIT(priv->doorbell),
++		       &mhu->recv->ch_wn[priv->ch_wn_idx].mask_set);
++}
++
++static void *mhuv2_doorbell_read_data(struct mhuv2 *mhu, struct mbox_chan=
 *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	writel_relaxed(BIT(priv->doorbell),
++		       &mhu->recv->ch_wn[priv->ch_wn_idx].stat_clear);
++	return NULL;
++}
++
++static int mhuv2_doorbell_last_tx_done(struct mhuv2 *mhu,
++				       struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	return !(readl_relaxed(&mhu->send->ch_wn[priv->ch_wn_idx].stat) &
++		 BIT(priv->doorbell));
++}
++
++static int mhuv2_doorbell_send_data(struct mhuv2 *mhu, struct mbox_chan *=
chan,
++				    void *arg)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	unsigned long flags;
++
++	spin_lock_irqsave(&mhu->doorbell_pending_lock, flags);
++
++	priv->pending =3D 1;
++	writel_relaxed(BIT(priv->doorbell),
++		       &mhu->send->ch_wn[priv->ch_wn_idx].stat_set);
++
++	spin_unlock_irqrestore(&mhu->doorbell_pending_lock, flags);
++
++	return 0;
++}
++
++static const struct mhuv2_protocol_ops mhuv2_doorbell_ops =3D {
++	.rx_startup =3D mhuv2_doorbell_rx_startup,
++	.rx_shutdown =3D mhuv2_doorbell_rx_shutdown,
++	.read_data =3D mhuv2_doorbell_read_data,
++	.last_tx_done =3D mhuv2_doorbell_last_tx_done,
++	.send_data =3D mhuv2_doorbell_send_data,
++};
++#define IS_PROTOCOL_DOORBELL(_priv) (_priv->ops =3D=3D &mhuv2_doorbell_op=
s)
++
++/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Data transfer transport protoc=
ol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
++
++static int mhuv2_data_transfer_rx_startup(struct mhuv2 *mhu,
++					  struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	int i =3D priv->ch_wn_idx + priv->windows - 1;
++
++	/*
++	 * The protocol mandates that all but the last status register must be
++	 * masked.
++	 */
++	writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_clear);
++	return 0;
++}
++
++static void mhuv2_data_transfer_rx_shutdown(struct mhuv2 *mhu,
++					    struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	int i =3D priv->ch_wn_idx + priv->windows - 1;
++
++	writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_set);
++}
++
++static void *mhuv2_data_transfer_read_data(struct mhuv2 *mhu,
++					   struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	const int windows =3D priv->windows;
++	struct arm_mhuv2_mbox_msg *msg;
++	u32 *data;
++	int i, idx;
++
++	msg =3D kzalloc(sizeof(*msg) + windows * MHUV2_STAT_BYTES, GFP_KERNEL);
++	if (!msg)
++		return ERR_PTR(-ENOMEM);
++
++	data =3D msg->data =3D msg + 1;
++	msg->len =3D windows * MHUV2_STAT_BYTES;
++
++	/*
++	 * Messages are expected in order of most significant word to least
++	 * significant word. Refer mhuv2_data_transfer_send_data() for more
++	 * details.
++	 *
++	 * We also need to read the stat register instead of stat_masked, as we
++	 * masked all but the last window.
++	 *
++	 * Last channel window must be cleared as the final operation. Upon
++	 * clearing the last channel window register, which is unmasked in
++	 * data-transfer protocol, the interrupt is de-asserted.
++	 */
++	for (i =3D 0; i < windows; i++) {
++		idx =3D priv->ch_wn_idx + i;
++		data[windows - 1 - i] =3D readl_relaxed(&mhu->recv->ch_wn[idx].stat);
++		writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[idx].stat_clear);
++	}
++
++	return msg;
++}
++
++static void mhuv2_data_transfer_tx_startup(struct mhuv2 *mhu,
++					   struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	int i =3D priv->ch_wn_idx + priv->windows - 1;
++
++	/* Enable interrupts only for the last window */
++	if (mhu->minor) {
++		writel_relaxed(0x1, &mhu->send->ch_wn[i].int_clr);
++		writel_relaxed(0x1, &mhu->send->ch_wn[i].int_en);
++	}
++}
++
++static void mhuv2_data_transfer_tx_shutdown(struct mhuv2 *mhu,
++					    struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	int i =3D priv->ch_wn_idx + priv->windows - 1;
++
++	if (mhu->minor)
++		writel_relaxed(0x0, &mhu->send->ch_wn[i].int_en);
++}
++
++static int mhuv2_data_transfer_last_tx_done(struct mhuv2 *mhu,
++					    struct mbox_chan *chan)
++{
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	int i =3D priv->ch_wn_idx + priv->windows - 1;
++
++	/* Just checking the last channel window should be enough */
++	return !readl_relaxed(&mhu->send->ch_wn[i].stat);
++}
++
++/*
++ * Message will be transmitted from most significant to least significant=
 word.
++ * This is to allow for messages shorter than channel windows to still tr=
igger
++ * the receiver interrupt which gets activated when the last stat registe=
r is
++ * written. As an example, a 6-word message is to be written on a 4-chann=
el MHU
++ * connection: Registers marked with '*' are masked, and will not generat=
e an
++ * interrupt on the receiver side once written.
++ *
++ * u32 *data =3D	[0x00000001], [0x00000002], [0x00000003], [0x00000004],
++ *		[0x00000005], [0x00000006]
++ *
++ * ROUND 1:
++ * stat reg		To write	Write sequence
++ * [ stat 3 ]	<-	[0x00000001]	4 <- triggers interrupt on receiver
++ * [ stat 2 ]	<-	[0x00000002]	3
++ * [ stat 1 ]	<-	[0x00000003]	2
++ * [ stat 0 ]	<-	[0x00000004]	1
++ *
++ * data +=3D 4 // Increment data pointer by number of stat regs
++ *
++ * ROUND 2:
++ * stat reg		To write	Write sequence
++ * [ stat 3 ]	<-	[0x00000005]	2 <- triggers interrupt on receiver
++ * [ stat 2 ]	<-	[0x00000006]	1
++ * [ stat 1 ]	<-	[0x00000000]
++ * [ stat 0 ]	<-	[0x00000000]
++ */
++static int mhuv2_data_transfer_send_data(struct mhuv2 *mhu,
++					 struct mbox_chan *chan, void *arg)
++{
++	const struct arm_mhuv2_mbox_msg *msg =3D arg;
++	int bytes_left =3D msg->len, bytes_to_send, bytes_in_round, i;
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++	int windows =3D priv->windows;
++	u32 *data =3D msg->data, word;
++
++	while (bytes_left) {
++		if (!data[0]) {
++			dev_err(mhu->mbox.dev, "Data aligned at first window can't be zero to =
guarantee interrupt generation at receiver");
++			return -EINVAL;
++		}
++
++		while(!mhuv2_data_transfer_last_tx_done(mhu, chan))
++			continue;
++
++		bytes_in_round =3D min(bytes_left, (int)(windows * MHUV2_STAT_BYTES));
++
++		for (i =3D windows - 1; i >=3D 0; i--) {
++			/* Data less than windows can transfer ? */
++			if (unlikely(bytes_in_round <=3D i * MHUV2_STAT_BYTES))
++				continue;
++
++			word =3D data[i];
++			bytes_to_send =3D bytes_in_round & (MHUV2_STAT_BYTES - 1);
++			if (unlikely(bytes_to_send))
++				word &=3D LSB_MASK(bytes_to_send);
++			else
++				bytes_to_send =3D MHUV2_STAT_BYTES;
++
++			writel_relaxed(word, &mhu->send->ch_wn[priv->ch_wn_idx + windows - 1 -=
 i].stat_set);
++			bytes_left -=3D bytes_to_send;
++			bytes_in_round -=3D bytes_to_send;
++		}
++
++		data +=3D windows;
++	}
++
++	return 0;
++}
++
++static const struct mhuv2_protocol_ops mhuv2_data_transfer_ops =3D {
++	.rx_startup =3D mhuv2_data_transfer_rx_startup,
++	.rx_shutdown =3D mhuv2_data_transfer_rx_shutdown,
++	.read_data =3D mhuv2_data_transfer_read_data,
++	.tx_startup =3D mhuv2_data_transfer_tx_startup,
++	.tx_shutdown =3D mhuv2_data_transfer_tx_shutdown,
++	.last_tx_done =3D mhuv2_data_transfer_last_tx_done,
++	.send_data =3D mhuv2_data_transfer_send_data,
++};
++
++/* Interrupt handlers */
++
++static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 *reg)
++{
++	struct mbox_chan *chans =3D mhu->mbox.chans;
++	int channel =3D 0, i, offset =3D 0, windows, protocol, ch_wn;
++	u32 stat;
++
++	for (i =3D 0; i < MHUV2_CMB_INT_ST_REG_CNT; i++) {
++		stat =3D readl_relaxed(reg + i);
++		if (!stat)
++			continue;
++
++		ch_wn =3D i * MHUV2_STAT_BITS + __builtin_ctz(stat);
++
++		for (i =3D 0; i < mhu->length; i +=3D 2) {
++			protocol =3D mhu->protocols[i];
++			windows =3D mhu->protocols[i + 1];
++
++			if (ch_wn >=3D offset + windows) {
++				if (protocol =3D=3D DOORBELL)
++					channel +=3D MHUV2_STAT_BITS * windows;
++				else
++					channel++;
++
++				offset +=3D windows;
++				continue;
++			}
++
++			/* Return first chan of the window in doorbell mode */
++			if (protocol =3D=3D DOORBELL)
++				channel +=3D MHUV2_STAT_BITS * (ch_wn - offset);
++
++			return &chans[channel];
++		}
++	}
++
++	return ERR_PTR(-EIO);
++}
++
++static irqreturn_t mhuv2_sender_interrupt(int irq, void *data)
++{
++	struct mhuv2 *mhu =3D data;
++	struct device *dev =3D mhu->mbox.dev;
++	struct mhuv2_mbox_chan_priv *priv;
++	struct mbox_chan *chan;
++	unsigned long flags;
++	int i, found =3D 0;
++	u32 stat;
++
++	chan =3D get_irq_chan_comb(mhu, mhu->send->chcomb_int_st);
++	if (IS_ERR(chan)) {
++		dev_warn(dev, "Failed to find channel for the Tx interrupt\n");
++		return IRQ_NONE;
++	}
++	priv =3D chan->con_priv;
++
++	if (!IS_PROTOCOL_DOORBELL(priv)) {
++		writel_relaxed(1, &mhu->send->ch_wn[priv->ch_wn_idx + priv->windows - 1=
].int_clr);
++
++		if (chan->cl) {
++			mbox_chan_txdone(chan, 0);
++			return IRQ_HANDLED;
++		}
++
++		dev_warn(dev, "Tx interrupt Received on channel (%u) not currently atta=
ched to a mailbox client\n",
++			 priv->ch_wn_idx);
++		return IRQ_NONE;
++	}
++
++	/* Clear the interrupt first, so we don't miss any doorbell later */
++	writel_relaxed(1, &mhu->send->ch_wn[priv->ch_wn_idx].int_clr);
++
++	/*
++	 * In Doorbell mode, make sure no new transitions happen while the
++	 * interrupt handler is trying to find the finished doorbell tx
++	 * operations, else we may think few of the transfers were complete
++	 * before they actually were.
++	 */
++	spin_lock_irqsave(&mhu->doorbell_pending_lock, flags);
++
++	/*
++	 * In case of doorbell mode, the first channel of the window is returned
++	 * by get_irq_chan_comb(). Find all the pending channels here.
++	 */
++	stat =3D readl_relaxed(&mhu->send->ch_wn[priv->ch_wn_idx].stat);
++
++	for (i =3D 0; i < MHUV2_STAT_BITS; i++) {
++		priv =3D chan[i].con_priv;
++
++		/* Find cases where pending was 1, but stat's bit is cleared */
++		if (priv->pending ^ ((stat >> i) & 0x1)) {
++			BUG_ON(!priv->pending);
++
++			if (!chan->cl) {
++				dev_warn(dev, "Tx interrupt received on doorbell (%u : %u) channel no=
t currently attached to a mailbox client\n",
++					 priv->ch_wn_idx, i);
++				continue;
++			}
++
++			mbox_chan_txdone(&chan[i], 0);
++			priv->pending =3D 0;
++			found++;
++		}
++	}
++
++	spin_unlock_irqrestore(&mhu->doorbell_pending_lock, flags);
++
++	if (!found) {
++		/*
++		 * We may have already processed the doorbell in the previous
++		 * iteration if the interrupt came right after we cleared it but
++		 * before we read the stat register.
++		 */
++		dev_dbg(dev, "Couldn't find the doorbell (%u) for the Tx interrupt inte=
rrupt\n",
++			priv->ch_wn_idx);
++		return IRQ_NONE;
++	}
++
++	return IRQ_HANDLED;
++}
++
++static struct mbox_chan *get_irq_chan_comb_rx(struct mhuv2 *mhu)
++{
++	struct mhuv2_mbox_chan_priv *priv;
++	struct mbox_chan *chan;
++	u32 stat;
++
++	chan =3D get_irq_chan_comb(mhu, mhu->recv->chcomb_int_st);
++	if (IS_ERR(chan))
++		return chan;
++
++	priv =3D chan->con_priv;
++	if (!IS_PROTOCOL_DOORBELL(priv))
++		return chan;
++
++	/*
++	 * In case of doorbell mode, the first channel of the window is returned
++	 * by the routine. Find the exact channel here.
++	 */
++	stat =3D readl_relaxed(&mhu->recv->ch_wn[priv->ch_wn_idx].stat_masked);
++	BUG_ON(!stat);
++
++	return chan + __builtin_ctz(stat);
++}
++
++static struct mbox_chan *get_irq_chan_stat_rx(struct mhuv2 *mhu)
++{
++	struct mbox_chan *chans =3D mhu->mbox.chans;
++	struct mhuv2_mbox_chan_priv *priv;
++	u32 stat;
++	int i =3D 0;
++
++	while (i < mhu->mbox.num_chans) {
++		priv =3D chans[i].con_priv;
++		stat =3D readl_relaxed(&mhu->recv->ch_wn[priv->ch_wn_idx].stat_masked);
++
++		if (stat) {
++			if (IS_PROTOCOL_DOORBELL(priv))
++				i +=3D __builtin_ctz(stat);
++			return &chans[i];
++		}
++
++		i +=3D IS_PROTOCOL_DOORBELL(priv) ? MHUV2_STAT_BITS : 1;
++	}
++
++	return ERR_PTR(-EIO);
++}
++
++static struct mbox_chan *get_irq_chan_rx(struct mhuv2 *mhu)
++{
++	if (!mhu->minor)
++		return get_irq_chan_stat_rx(mhu);
++
++	return get_irq_chan_comb_rx(mhu);
++}
++
++static irqreturn_t mhuv2_receiver_interrupt(int irq, void *arg)
++{
++	struct mhuv2 *mhu =3D arg;
++	struct mbox_chan *chan =3D get_irq_chan_rx(mhu);
++	struct device *dev =3D mhu->mbox.dev;
++	struct mhuv2_mbox_chan_priv *priv;
++	int ret =3D IRQ_NONE;
++	void *data;
++
++	if (IS_ERR(chan)) {
++		dev_warn(dev, "Failed to find channel for the rx interrupt\n");
++		return IRQ_NONE;
++	}
++	priv =3D chan->con_priv;
++
++	/* Read and clear the data first */
++	data =3D priv->ops->read_data(mhu, chan);
++
++	if (!chan->cl) {
++		dev_warn(dev, "Received data on channel (%u) not currently attached to =
a mailbox client\n",
++			 priv->ch_wn_idx);
++	} else if (IS_ERR(data)) {
++		dev_err(dev, "Failed to read data: %lu\n", PTR_ERR(data));
++	} else {
++		mbox_chan_received_data(chan, data);
++		ret =3D IRQ_HANDLED;
++	}
++
++	kfree(data);
++	return ret;
++}
++
++/* Sender and receiver ops */
++static bool mhuv2_sender_last_tx_done(struct mbox_chan *chan)
++{
++	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	return priv->ops->last_tx_done(mhu, chan);
++}
++
++static int mhuv2_sender_send_data(struct mbox_chan *chan, void *data)
++{
++	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	if (!priv->ops->last_tx_done(mhu, chan))
++		return -EBUSY;
++
++	return priv->ops->send_data(mhu, chan, data);
++}
++
++static int mhuv2_sender_startup(struct mbox_chan *chan)
++{
++	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	if (priv->ops->tx_startup)
++		priv->ops->tx_startup(mhu, chan);
++	return 0;
++}
++
++static void mhuv2_sender_shutdown(struct mbox_chan *chan)
++{
++	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	if (priv->ops->tx_shutdown)
++		priv->ops->tx_shutdown(mhu, chan);
++}
++
++static const struct mbox_chan_ops mhuv2_sender_ops =3D {
++	.send_data =3D mhuv2_sender_send_data,
++	.startup =3D mhuv2_sender_startup,
++	.shutdown =3D mhuv2_sender_shutdown,
++	.last_tx_done =3D mhuv2_sender_last_tx_done,
++};
++
++static int mhuv2_receiver_startup(struct mbox_chan *chan)
++{
++	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	return priv->ops->rx_startup(mhu, chan);
++}
++
++static void mhuv2_receiver_shutdown(struct mbox_chan *chan)
++{
++	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
++	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
++
++	priv->ops->rx_shutdown(mhu, chan);
++}
++
++static int mhuv2_receiver_send_data(struct mbox_chan *chan, void *data)
++{
++	dev_err(chan->mbox->dev,
++		"Trying to transmit on a receiver MHU frame\n");
++	return -EIO;
++}
++
++static bool mhuv2_receiver_last_tx_done(struct mbox_chan *chan)
++{
++	dev_err(chan->mbox->dev, "Trying to Tx poll on a receiver MHU frame\n");
++	return true;
++}
++
++static const struct mbox_chan_ops mhuv2_receiver_ops =3D {
++	.send_data =3D mhuv2_receiver_send_data,
++	.startup =3D mhuv2_receiver_startup,
++	.shutdown =3D mhuv2_receiver_shutdown,
++	.last_tx_done =3D mhuv2_receiver_last_tx_done,
++};
++
++static struct mbox_chan *mhuv2_mbox_of_xlate(struct mbox_controller *mbox=
,
++					     const struct of_phandle_args *pa)
++{
++	struct mhuv2 *mhu =3D mhu_from_mbox(mbox);
++	struct mbox_chan *chans =3D mbox->chans;
++	int channel =3D 0, i, offset, doorbell, protocol, windows;
++
++	if (pa->args_count !=3D 2)
++		return ERR_PTR(-EINVAL);
++
++	offset =3D pa->args[0];
++	doorbell =3D pa->args[1];
++	if (doorbell >=3D MHUV2_STAT_BITS)
++		goto out;
++
++	for (i =3D 0; i < mhu->length; i +=3D 2) {
++		protocol =3D mhu->protocols[i];
++		windows =3D mhu->protocols[i + 1];
++
++		if (protocol =3D=3D DOORBELL) {
++			if (offset < windows)
++				return &chans[channel + MHUV2_STAT_BITS * offset + doorbell];
++
++			channel +=3D MHUV2_STAT_BITS * windows;
++			offset -=3D windows;
++		} else {
++			if (offset =3D=3D 0) {
++				if (doorbell)
++					goto out;
++
++				return &chans[channel];
++			}
++
++			channel++;
++			offset--;
++		}
++	}
++
++out:
++	dev_err(mbox->dev, "Couldn't xlate to a valid channel (%d: %d)\n",
++		pa->args[0], doorbell);
++	return ERR_PTR(-ENODEV);
++}
++
++static int mhuv2_verify_protocol(struct mhuv2 *mhu)
++{
++	struct device *dev =3D mhu->mbox.dev;
++	int protocol, windows, channels =3D 0, total_windows =3D 0, i;
++
++	for (i =3D 0; i < mhu->length; i +=3D 2) {
++		protocol =3D mhu->protocols[i];
++		windows =3D mhu->protocols[i + 1];
++
++		if (!windows) {
++			dev_err(dev, "Window size can't be zero (%d)\n", i);
++			return -EINVAL;
++		}
++		total_windows +=3D windows;
++
++		if (protocol =3D=3D DOORBELL) {
++			channels +=3D MHUV2_STAT_BITS * windows;
++		} else if (protocol =3D=3D DATA_TRANSFER) {
++			channels++;
++		} else {
++			dev_err(dev, "Invalid protocol (%d) present in %s property at index %d=
\n",
++				protocol, MHUV2_PROTOCOL_PROP, i);
++			return -EINVAL;
++		}
++	}
++
++	if (total_windows > mhu->windows) {
++		dev_err(dev, "Channel windows can't be more than what's implemented by =
the hardware ( %d: %d)\n",
++			total_windows, mhu->windows);
++		return -EINVAL;
++	}
++
++	mhu->mbox.num_chans =3D channels;
++	return 0;
++}
++
++static int mhuv2_allocate_channels(struct mhuv2 *mhu)
++{
++	struct mbox_controller *mbox =3D &mhu->mbox;
++	struct mhuv2_mbox_chan_priv *priv;
++	struct device *dev =3D mbox->dev;
++	struct mbox_chan *chans;
++	int protocol, windows =3D 0, next_window =3D 0, i, j, k;
++
++	chans =3D devm_kcalloc(dev, mbox->num_chans, sizeof(*chans), GFP_KERNEL)=
;
++	if (!chans)
++		return -ENOMEM;
++
++	mbox->chans =3D chans;
++
++	for (i =3D 0; i < mhu->length; i +=3D 2) {
++		next_window +=3D windows;
++
++		protocol =3D mhu->protocols[i];
++		windows =3D mhu->protocols[i + 1];
++
++		if (protocol =3D=3D DATA_TRANSFER) {
++			priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
++			if (!priv)
++				return -ENOMEM;
++
++			priv->ch_wn_idx =3D next_window;
++			priv->ops =3D &mhuv2_data_transfer_ops;
++			priv->windows =3D windows;
++			chans++->con_priv =3D priv;
++			continue;
++		}
++
++		for (j =3D 0; j < windows; j++) {
++			for (k =3D 0; k < MHUV2_STAT_BITS; k++) {
++				priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
++				if (!priv)
++					return -ENOMEM;
++
++				priv->ch_wn_idx =3D next_window + j;
++				priv->ops =3D &mhuv2_doorbell_ops;
++				priv->doorbell =3D k;
++				chans++->con_priv =3D priv;
++			}
++
++			/*
++			 * Permanently enable interrupt as we can't
++			 * control it per doorbell.
++			 */
++			if (mhu->frame =3D=3D SENDER_FRAME && mhu->minor)
++				writel_relaxed(0x1, &mhu->send->ch_wn[priv->ch_wn_idx].int_en);
++		}
++	}
++
++	/* Make sure we have initialized all channels */
++	BUG_ON(chans - mbox->chans !=3D mbox->num_chans);
++
++	return 0;
++}
++
++static int mhuv2_parse_channels(struct mhuv2 *mhu)
++{
++	struct device *dev =3D mhu->mbox.dev;
++	const struct device_node *np =3D dev->of_node;
++	int ret, count;
++	u32 *protocols;
++
++	count =3D of_property_count_u32_elems(np, MHUV2_PROTOCOL_PROP);
++	if (count <=3D 0 || count % 2) {
++		dev_err(dev, "Invalid %s property (%d)\n", MHUV2_PROTOCOL_PROP,
++			count);
++		return -EINVAL;
++	}
++
++	protocols =3D devm_kmalloc_array(dev, count, sizeof(*protocols), GFP_KER=
NEL);
++	if (!protocols)
++		return -ENOMEM;
++
++	ret =3D of_property_read_u32_array(np, MHUV2_PROTOCOL_PROP, protocols, c=
ount);
++	if (ret) {
++		dev_err(dev, "Failed to read %s property: %d\n",
++			MHUV2_PROTOCOL_PROP, ret);
++		return ret;
++	}
++
++	mhu->protocols =3D protocols;
++	mhu->length =3D count;
++
++	ret =3D mhuv2_verify_protocol(mhu);
++	if (ret)
++		return ret;
++
++	return mhuv2_allocate_channels(mhu);
++}
++
++static int mhuv2_tx_init(struct amba_device *adev, struct mhuv2 *mhu,
++			 void __iomem *reg)
++{
++	struct device *dev =3D mhu->mbox.dev;
++	int ret, i;
++
++	mhu->frame =3D SENDER_FRAME;
++	mhu->mbox.ops =3D &mhuv2_sender_ops;
++	mhu->send =3D reg;
++
++	mhu->windows =3D readl_relaxed_bitfield(&mhu->send->mhu_cfg, num_ch);
++	mhu->minor =3D readl_relaxed_bitfield(&mhu->send->aidr, arch_minor_rev);
++
++	spin_lock_init(&mhu->doorbell_pending_lock);
++
++	/*
++	 * For minor version 1 and forward, tx interrupt is provided by
++	 * the controller.
++	 */
++	if (mhu->minor && adev->irq[0]) {
++		ret =3D devm_request_threaded_irq(dev, adev->irq[0], NULL,
++						mhuv2_sender_interrupt,
++						IRQF_ONESHOT, "mhuv2-tx", mhu);
++		if (ret) {
++			dev_err(dev, "Failed to request tx IRQ, fallback to polling mode: %d\n=
",
++				ret);
++		} else {
++			mhu->mbox.txdone_irq =3D true;
++			mhu->mbox.txdone_poll =3D false;
++			mhu->irq =3D adev->irq[0];
++
++			writel_relaxed_bitfield(1, &mhu->send->int_en, chcomb);
++
++			/* Disable all channel interrupts */
++			for (i =3D 0; i < mhu->windows; i++)
++				writel_relaxed(0x0, &mhu->send->ch_wn[i].int_en);
++
++			goto out;
++		}
++	}
++
++	mhu->mbox.txdone_irq =3D false;
++	mhu->mbox.txdone_poll =3D true;
++	mhu->mbox.txpoll_period =3D 1;
++
++out:
++	/* Wait for receiver to be ready */
++	writel_relaxed(0x1, &mhu->send->access_request);
++	while (!readl_relaxed(&mhu->send->access_ready))
++		continue;
++
++	return 0;
++}
++
++static int mhuv2_rx_init(struct amba_device *adev, struct mhuv2 *mhu,
++			 void __iomem *reg)
++{
++	struct device *dev =3D mhu->mbox.dev;
++	int ret, i;
++
++	mhu->frame =3D RECEIVER_FRAME;
++	mhu->mbox.ops =3D &mhuv2_receiver_ops;
++	mhu->recv =3D reg;
++
++	mhu->windows =3D readl_relaxed_bitfield(&mhu->recv->mhu_cfg, num_ch);
++	mhu->minor =3D readl_relaxed_bitfield(&mhu->recv->aidr, arch_minor_rev);
++
++	mhu->irq =3D adev->irq[0];
++	if (!mhu->irq) {
++		dev_err(dev, "Missing receiver IRQ\n");
++		return -EINVAL;
++	}
++
++	ret =3D devm_request_threaded_irq(dev, mhu->irq, NULL,
++					mhuv2_receiver_interrupt, IRQF_ONESHOT,
++					"mhuv2-rx", mhu);
++	if (ret) {
++		dev_err(dev, "Failed to request rx IRQ\n");
++		return ret;
++	}
++
++	/* Mask all the channel windows */
++	for (i =3D 0; i < mhu->windows; i++)
++		writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_set);
++
++	if (mhu->minor)
++		writel_relaxed_bitfield(1, &mhu->recv->int_en, chcomb);
++
++	return 0;
++}
++
++static int mhuv2_probe(struct amba_device *adev, const struct amba_id *id=
)
++{
++	struct device *dev =3D &adev->dev;
++	const struct device_node *np =3D dev->of_node;
++	struct mhuv2 *mhu;
++	void __iomem *reg;
++	int ret =3D -EINVAL;
++
++	reg =3D devm_of_iomap(dev, dev->of_node, 0, NULL);
++	if (!reg)
++		return -ENOMEM;
++
++	mhu =3D devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
++	if (!mhu)
++		return -ENOMEM;
++
++	mhu->mbox.dev =3D dev;
++	mhu->mbox.of_xlate =3D mhuv2_mbox_of_xlate;
++
++	if (of_device_is_compatible(np, "arm,mhuv2-tx"))
++		ret =3D mhuv2_tx_init(adev, mhu, reg);
++	else if (of_device_is_compatible(np, "arm,mhuv2-rx"))
++		ret =3D mhuv2_rx_init(adev, mhu, reg);
++	else
++		dev_err(dev, "Invalid compatible property\n");
++
++	if (ret)
++		return ret;
++
++	/* Channel windows can't be 0 */
++	BUG_ON(!mhu->windows);
++
++	ret =3D mhuv2_parse_channels(mhu);
++	if (ret)
++		return ret;
++
++	amba_set_drvdata(adev, mhu);
++
++	ret =3D devm_mbox_controller_register(dev, &mhu->mbox);
++	if (ret)
++		dev_err(dev, "failed to register ARM MHUv2 driver %d\n", ret);
++
++	return ret;
++}
++
++static int mhuv2_remove(struct amba_device *adev)
++{
++	struct mhuv2 *mhu =3D amba_get_drvdata(adev);
++
++	if (mhu->frame =3D=3D SENDER_FRAME)
++		writel_relaxed(0x0, &mhu->send->access_request);
++
++	return 0;
++}
++
++static struct amba_id mhuv2_ids[] =3D {
++	{
++		/* 2.0 */
++		.id =3D 0xbb0d1,
++		.mask =3D 0xfffff,
++	},
++	{
++		/* 2.1 */
++		.id =3D 0xbb076,
++		.mask =3D 0xfffff,
++	},
++	{ 0, 0 },
++};
++MODULE_DEVICE_TABLE(amba, mhuv2_ids);
++
++static struct amba_driver mhuv2_driver =3D {
++	.drv =3D {
++		.name	=3D "arm-mhuv2",
++	},
++	.id_table	=3D mhuv2_ids,
++	.probe		=3D mhuv2_probe,
++	.remove		=3D mhuv2_remove,
++};
++module_amba_driver(mhuv2_driver);
++
++MODULE_LICENSE("GPL v2");
++MODULE_DESCRIPTION("ARM MHUv2 Driver");
++MODULE_AUTHOR("Viresh Kumar <viresh.kumar@linaro.org>");
++MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
+diff --git a/include/linux/mailbox/arm_mhuv2_message.h b/include/linux/mai=
lbox/arm_mhuv2_message.h
+new file mode 100644
+index 000000000000..821b9d96daa4
+--- /dev/null
++++ b/include/linux/mailbox/arm_mhuv2_message.h
+@@ -0,0 +1,20 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * ARM MHUv2 Mailbox Message
++ *
++ * Copyright (C) 2020 Arm Ltd.
++ * Copyright (C) 2020 Linaro Ltd.
++ */
++
++#ifndef _LINUX_ARM_MHUV2_MESSAGE_H_
++#define _LINUX_ARM_MHUV2_MESSAGE_H_
++
++#include <linux/types.h>
++
++/* Data structure for data-transfer protocol */
++struct arm_mhuv2_mbox_msg {
++	void *data;
++	size_t len;
++};
++
++#endif /* _LINUX_ARM_MHUV2_MESSAGE_H_ */
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/000=
6-mailbox-arm_mhuv2-Fix-sparse-warnings.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.10/tc0/0006-mailbox-arm_mhuv2-Fix-sparse-warnings.=
patch
new file mode 100644
index 0000000..46fe1aa
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0006-mailb=
ox-arm_mhuv2-Fix-sparse-warnings.patch
@@ -0,0 +1,114 @@
+From f082677cb35ea843e749e1c9e5a9b9fba44c5d48 Mon Sep 17 00:00:00 2001
+From: Viresh Kumar <viresh.kumar@linaro.org>
+Date: Wed, 30 Dec 2020 10:12:04 +0530
+Subject: [PATCH 06/10] mailbox: arm_mhuv2: Fix sparse warnings
+
+This patch fixes a bunch of sparse warnings in the newly added arm_mhuv2
+driver.
+
+drivers/mailbox/arm_mhuv2.c:506:24: warning: incorrect type in argument 1 =
(different address spaces)
+drivers/mailbox/arm_mhuv2.c:506:24:    expected void const volatile [noder=
ef] __iomem *addr
+drivers/mailbox/arm_mhuv2.c:506:24:    got unsigned int [usertype] *
+drivers/mailbox/arm_mhuv2.c:547:42: warning: incorrect type in argument 2 =
(different address spaces)
+drivers/mailbox/arm_mhuv2.c:547:42:    expected unsigned int [usertype] *r=
eg
+drivers/mailbox/arm_mhuv2.c:547:42:    got unsigned int [noderef] __iomem =
*
+drivers/mailbox/arm_mhuv2.c:625:42: warning: incorrect type in argument 2 =
(different address spaces)
+drivers/mailbox/arm_mhuv2.c:625:42:    expected unsigned int [usertype] *r=
eg
+drivers/mailbox/arm_mhuv2.c:625:42:    got unsigned int [noderef] __iomem =
*
+drivers/mailbox/arm_mhuv2.c:972:24: warning: dereference of noderef expres=
sion
+drivers/mailbox/arm_mhuv2.c:973:22: warning: dereference of noderef expres=
sion
+drivers/mailbox/arm_mhuv2.c:993:25: warning: dereference of noderef expres=
sion
+drivers/mailbox/arm_mhuv2.c:1026:24: warning: dereference of noderef expre=
ssion
+drivers/mailbox/arm_mhuv2.c:1027:22: warning: dereference of noderef expre=
ssion
+drivers/mailbox/arm_mhuv2.c:1048:17: warning: dereference of noderef expre=
ssion
+
+Reported-by: kernel test robot <lkp@intel.com>
+Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
+Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
+
+Upstream-Status: Backport [https://lkml.org/lkml/2021/2/9/428]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ drivers/mailbox/arm_mhuv2.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
+index 67fb10885bb4..8223c1005254 100644
+--- a/drivers/mailbox/arm_mhuv2.c
++++ b/drivers/mailbox/arm_mhuv2.c
+@@ -238,19 +238,19 @@ struct mhuv2_mbox_chan_priv {
+ };
+=20
+ /* Macro for reading a bitfield within a physically mapped packed struct =
*/
+-#define readl_relaxed_bitfield(_regptr, _field)				\
++#define readl_relaxed_bitfield(_regptr, _type, _field)			\
+ 	({								\
+ 		u32 _regval;						\
+ 		_regval =3D readl_relaxed((_regptr));			\
+-		(*(typeof((_regptr)))(&_regval))._field;		\
++		(*(_type *)(&_regval))._field;				\
+ 	})
+=20
+ /* Macro for writing a bitfield within a physically mapped packed struct =
*/
+-#define writel_relaxed_bitfield(_value, _regptr, _field)		\
++#define writel_relaxed_bitfield(_value, _regptr, _type, _field)		\
+ 	({								\
+ 		u32 _regval;						\
+ 		_regval =3D readl_relaxed(_regptr);			\
+-		(*(typeof(_regptr))(&_regval))._field =3D _value;		\
++		(*(_type *)(&_regval))._field =3D _value;			\
+ 		writel_relaxed(_regval, _regptr);			\
+ 	})
+=20
+@@ -496,7 +496,7 @@ static const struct mhuv2_protocol_ops mhuv2_data_tran=
sfer_ops =3D {
+=20
+ /* Interrupt handlers */
+=20
+-static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 *reg)
++static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 __iomem=
 *reg)
+ {
+ 	struct mbox_chan *chans =3D mhu->mbox.chans;
+ 	int channel =3D 0, i, offset =3D 0, windows, protocol, ch_wn;
+@@ -969,8 +969,8 @@ static int mhuv2_tx_init(struct amba_device *adev, str=
uct mhuv2 *mhu,
+ 	mhu->mbox.ops =3D &mhuv2_sender_ops;
+ 	mhu->send =3D reg;
+=20
+-	mhu->windows =3D readl_relaxed_bitfield(&mhu->send->mhu_cfg, num_ch);
+-	mhu->minor =3D readl_relaxed_bitfield(&mhu->send->aidr, arch_minor_rev);
++	mhu->windows =3D readl_relaxed_bitfield(&mhu->send->mhu_cfg, struct mhu_=
cfg_t, num_ch);
++	mhu->minor =3D readl_relaxed_bitfield(&mhu->send->aidr, struct aidr_t, a=
rch_minor_rev);
+=20
+ 	spin_lock_init(&mhu->doorbell_pending_lock);
+=20
+@@ -990,7 +990,7 @@ static int mhuv2_tx_init(struct amba_device *adev, str=
uct mhuv2 *mhu,
+ 			mhu->mbox.txdone_poll =3D false;
+ 			mhu->irq =3D adev->irq[0];
+=20
+-			writel_relaxed_bitfield(1, &mhu->send->int_en, chcomb);
++			writel_relaxed_bitfield(1, &mhu->send->int_en, struct int_en_t, chcomb=
);
+=20
+ 			/* Disable all channel interrupts */
+ 			for (i =3D 0; i < mhu->windows; i++)
+@@ -1023,8 +1023,8 @@ static int mhuv2_rx_init(struct amba_device *adev, s=
truct mhuv2 *mhu,
+ 	mhu->mbox.ops =3D &mhuv2_receiver_ops;
+ 	mhu->recv =3D reg;
+=20
+-	mhu->windows =3D readl_relaxed_bitfield(&mhu->recv->mhu_cfg, num_ch);
+-	mhu->minor =3D readl_relaxed_bitfield(&mhu->recv->aidr, arch_minor_rev);
++	mhu->windows =3D readl_relaxed_bitfield(&mhu->recv->mhu_cfg, struct mhu_=
cfg_t, num_ch);
++	mhu->minor =3D readl_relaxed_bitfield(&mhu->recv->aidr, struct aidr_t, a=
rch_minor_rev);
+=20
+ 	mhu->irq =3D adev->irq[0];
+ 	if (!mhu->irq) {
+@@ -1045,7 +1045,7 @@ static int mhuv2_rx_init(struct amba_device *adev, s=
truct mhuv2 *mhu,
+ 		writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_set);
+=20
+ 	if (mhu->minor)
+-		writel_relaxed_bitfield(1, &mhu->recv->int_en, chcomb);
++		writel_relaxed_bitfield(1, &mhu->recv->int_en, struct int_en_t, chcomb)=
;
+=20
+ 	return 0;
+ }
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/000=
7-mailbox-arm_mhuv2-make-remove-callback-return-void.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-arm64-ack-5.10/tc0/0007-mailbox-arm_mhuv2-make-re=
move-callback-return-void.patch
new file mode 100644
index 0000000..cd1bb0b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0007-mailb=
ox-arm_mhuv2-make-remove-callback-return-void.patch
@@ -0,0 +1,47 @@
+From a0e07a4d72dfe8892ebcfb29c0a1007c35eebd66 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@pengu=
tronix.de>
+Date: Tue, 2 Feb 2021 20:43:08 +0100
+Subject: [PATCH 07/10] mailbox: arm_mhuv2: make remove callback return voi=
d
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+My build tests failed to catch that amba driver that would have needed
+adaption in commit 3fd269e74f2f ("amba: Make the remove callback return
+void"). Change the remove function to make the driver build again.
+
+Reported-by: kernel test robot <lkp@intel.com>
+Fixes: 3fd269e74f2f ("amba: Make the remove callback return void")
+Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
+Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
+Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
+
+Upstream-Status: Backport [https://lkml.org/lkml/2021/2/2/1525]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ drivers/mailbox/arm_mhuv2.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
+index 8223c1005254..cdfb1939fabf 100644
+--- a/drivers/mailbox/arm_mhuv2.c
++++ b/drivers/mailbox/arm_mhuv2.c
+@@ -1095,14 +1095,12 @@ static int mhuv2_probe(struct amba_device *adev, c=
onst struct amba_id *id)
+ 	return ret;
+ }
+=20
+-static int mhuv2_remove(struct amba_device *adev)
++static void mhuv2_remove(struct amba_device *adev)
+ {
+ 	struct mhuv2 *mhu =3D amba_get_drvdata(adev);
+=20
+ 	if (mhu->frame =3D=3D SENDER_FRAME)
+ 		writel_relaxed(0x0, &mhu->send->access_request);
+-
+-	return 0;
+ }
+=20
+ static struct amba_id mhuv2_ids[] =3D {
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/000=
8-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0008-mailbox-arm_mhuv2-Skip-=
calling-kfree-with-invalid-po.patch
new file mode 100644
index 0000000..6553594
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/0008-mailb=
ox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
@@ -0,0 +1,41 @@
+From c55091b7738802c503b1ce4276ee85d601604506 Mon Sep 17 00:00:00 2001
+From: Viresh Kumar <viresh.kumar@linaro.org>
+Date: Mon, 22 Feb 2021 12:48:06 +0530
+Subject: [PATCH 08/10] mailbox: arm_mhuv2: Skip calling kfree() with inval=
id
+ pointer
+
+It is possible that 'data' passed to kfree() is set to a error value
+instead of allocated space. Make sure it doesn't get called with invalid
+pointer.
+
+Fixes: 5a6338cce9f4 ("mailbox: arm_mhuv2: Add driver")
+Cc: v5.11 <stable@vger.kernel.org> # v5.11
+Reported-by: kernel test robot <lkp@intel.com>
+Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
+Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
+
+Upstream-Status: Backport [https://lkml.org/lkml/2021/2/22/57]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ drivers/mailbox/arm_mhuv2.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
+index cdfb1939fabf..d997f8ebfa98 100644
+--- a/drivers/mailbox/arm_mhuv2.c
++++ b/drivers/mailbox/arm_mhuv2.c
+@@ -699,7 +699,9 @@ static irqreturn_t mhuv2_receiver_interrupt(int irq, v=
oid *arg)
+ 		ret =3D IRQ_HANDLED;
+ 	}
+=20
+-	kfree(data);
++	if (!IS_ERR(data))
++		kfree(data);
++
+ 	return ret;
+ }
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defc=
onfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/defconfi=
g
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defco=
nfig
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/defcon=
fig
index c8caa05..f16b899 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc0/defconfig
@@ -2,7 +2,6 @@ CONFIG_POSIX_MQUEUE=3Dy
 CONFIG_AUDIT=3Dy
 CONFIG_NO_HZ=3Dy
 CONFIG_HIGH_RES_TIMERS=3Dy
-CONFIG_ASYMMETRIC_AARCH32=3Dy
 CONFIG_PREEMPT=3Dy
 CONFIG_IRQ_TIME_ACCOUNTING=3Dy
 CONFIG_BSD_PROCESS_ACCT=3Dy
@@ -67,7 +66,6 @@ CONFIG_ARCH_ZYNQMP=3Dy
 CONFIG_ARM64_VA_BITS_48=3Dy
 CONFIG_SCHED_MC=3Dy
 CONFIG_NUMA=3Dy
-CONFIG_SECCOMP=3Dy
 CONFIG_KEXEC=3Dy
 CONFIG_CRASH_DUMP=3Dy
 CONFIG_XEN=3Dy
@@ -86,7 +84,6 @@ CONFIG_ARM_CPUIDLE=3Dy
 CONFIG_ARM_PSCI_CPUIDLE=3Dy
 CONFIG_CPU_FREQ=3Dy
 CONFIG_CPU_FREQ_STAT=3Dy
-CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=3Dy
 CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
 CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
 CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
@@ -113,10 +110,10 @@ CONFIG_IMX_SCU_PD=3Dy
 CONFIG_ACPI=3Dy
 CONFIG_ACPI_APEI=3Dy
 CONFIG_ACPI_APEI_GHES=3Dy
-CONFIG_ACPI_APEI_PCIEAER=3Dy
 CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
 CONFIG_ACPI_APEI_EINJ=3Dy
 CONFIG_VIRTUALIZATION=3Dy
+CONFIG_KVM=3Dy
 CONFIG_ARM64_CRYPTO=3Dy
 CONFIG_CRYPTO_SHA1_ARM64_CE=3Dy
 CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
@@ -242,7 +239,6 @@ CONFIG_QRTR_TUN=3Dm
 CONFIG_BPF_JIT=3Dy
 CONFIG_BT=3Dm
 CONFIG_BT_HIDP=3Dm
-# CONFIG_BT_HS is not set
 # CONFIG_BT_LE is not set
 CONFIG_BT_LEDS=3Dy
 # CONFIG_BT_DEBUGFS is not set
@@ -278,7 +274,6 @@ CONFIG_PCIE_QCOM=3Dy
 CONFIG_PCIE_ARMADA_8K=3Dy
 CONFIG_PCIE_KIRIN=3Dy
 CONFIG_PCIE_HISI_STB=3Dy
-CONFIG_PCIE_TEGRA194=3Dm
 CONFIG_DEVTMPFS=3Dy
 CONFIG_DEVTMPFS_MOUNT=3Dy
 CONFIG_FW_LOADER_USER_HELPER=3Dy
@@ -287,12 +282,12 @@ CONFIG_HISILICON_LPC=3Dy
 CONFIG_SIMPLE_PM_BUS=3Dy
 CONFIG_MTD=3Dy
 CONFIG_MTD_BLOCK=3Dy
+CONFIG_MTD_PHRAM=3Dy
 CONFIG_MTD_RAW_NAND=3Dy
 CONFIG_MTD_NAND_DENALI_DT=3Dy
 CONFIG_MTD_NAND_MARVELL=3Dy
 CONFIG_MTD_NAND_QCOM=3Dy
 CONFIG_MTD_SPI_NOR=3Dy
-CONFIG_SPI_CADENCE_QUADSPI=3Dy
 CONFIG_BLK_DEV_LOOP=3Dy
 CONFIG_BLK_DEV_NBD=3Dm
 CONFIG_BLK_DEV_RAM=3Dy
@@ -367,14 +362,14 @@ CONFIG_SMSC911X=3Dy
 CONFIG_SNI_AVE=3Dy
 CONFIG_SNI_NETSEC=3Dy
 CONFIG_STMMAC_ETH=3Dm
-CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
-CONFIG_AT803X_PHY=3Dy
+CONFIG_MESON_GXL_PHY=3Dm
 CONFIG_MARVELL_PHY=3Dm
 CONFIG_MARVELL_10G_PHY=3Dm
-CONFIG_MESON_GXL_PHY=3Dm
 CONFIG_MICREL_PHY=3Dy
+CONFIG_AT803X_PHY=3Dy
 CONFIG_REALTEK_PHY=3Dm
 CONFIG_ROCKCHIP_PHY=3Dy
+CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
 CONFIG_PPP=3Dy
 CONFIG_PPP_BSDCOMP=3Dy
 CONFIG_PPP_DEFLATE=3Dy
@@ -403,7 +398,6 @@ CONFIG_INPUT_EVDEV=3Dy
 CONFIG_KEYBOARD_ADC=3Dm
 CONFIG_KEYBOARD_GPIO=3Dy
 CONFIG_KEYBOARD_SNVS_PWRKEY=3Dm
-CONFIG_KEYBOARD_CROS_EC=3Dy
 CONFIG_INPUT_TOUCHSCREEN=3Dy
 CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
 CONFIG_INPUT_MISC=3Dy
@@ -470,11 +464,11 @@ CONFIG_I2C_SH_MOBILE=3Dy
 CONFIG_I2C_TEGRA=3Dy
 CONFIG_I2C_UNIPHIER_F=3Dy
 CONFIG_I2C_RCAR=3Dy
-CONFIG_I2C_CROS_EC_TUNNEL=3Dy
 CONFIG_SPI=3Dy
 CONFIG_SPI_ARMADA_3700=3Dy
 CONFIG_SPI_BCM2835=3Dm
 CONFIG_SPI_BCM2835AUX=3Dm
+CONFIG_SPI_CADENCE_QUADSPI=3Dy
 CONFIG_SPI_NXP_FLEXSPI=3Dy
 CONFIG_SPI_IMX=3Dm
 CONFIG_SPI_MESON_SPICC=3Dm
@@ -498,16 +492,16 @@ CONFIG_PINCTRL_IMX8MM=3Dy
 CONFIG_PINCTRL_IMX8MN=3Dy
 CONFIG_PINCTRL_IMX8MQ=3Dy
 CONFIG_PINCTRL_IMX8QXP=3Dy
-CONFIG_PINCTRL_IPQ8074=3Dy
-CONFIG_PINCTRL_MSM8916=3Dy
-CONFIG_PINCTRL_MSM8994=3Dy
-CONFIG_PINCTRL_MSM8996=3Dy
-CONFIG_PINCTRL_MSM8998=3Dy
-CONFIG_PINCTRL_QCS404=3Dy
-CONFIG_PINCTRL_QDF2XXX=3Dy
+CONFIG_PINCTRL_IPQ8074=3Dm
+CONFIG_PINCTRL_MSM8916=3Dm
+CONFIG_PINCTRL_MSM8994=3Dm
+CONFIG_PINCTRL_MSM8996=3Dm
+CONFIG_PINCTRL_MSM8998=3Dm
+CONFIG_PINCTRL_QCS404=3Dm
+CONFIG_PINCTRL_QDF2XXX=3Dm
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=3Dy
-CONFIG_PINCTRL_SDM845=3Dy
-CONFIG_PINCTRL_SM8150=3Dy
+CONFIG_PINCTRL_SDM845=3Dm
+CONFIG_PINCTRL_SM8150=3Dm
 CONFIG_GPIO_ALTERA=3Dm
 CONFIG_GPIO_DWAPB=3Dy
 CONFIG_GPIO_MB86S7X=3Dy
@@ -520,14 +514,13 @@ CONFIG_GPIO_MAX732X=3Dy
 CONFIG_GPIO_PCA953X=3Dy
 CONFIG_GPIO_PCA953X_IRQ=3Dy
 CONFIG_GPIO_MAX77620=3Dy
-CONFIG_POWER_AVS=3Dy
-CONFIG_ROCKCHIP_IODOMAIN=3Dy
 CONFIG_POWER_RESET_MSM=3Dy
 CONFIG_POWER_RESET_XGENE=3Dy
 CONFIG_POWER_RESET_SYSCON=3Dy
 CONFIG_SYSCON_REBOOT_MODE=3Dy
 CONFIG_BATTERY_SBS=3Dm
 CONFIG_BATTERY_BQ27XXX=3Dy
+CONFIG_SENSORS_ARM_SCMI=3Dy
 CONFIG_SENSORS_ARM_SCPI=3Dy
 CONFIG_SENSORS_LM90=3Dm
 CONFIG_SENSORS_PWM_FAN=3Dm
@@ -586,7 +579,7 @@ CONFIG_REGULATOR_MAX77620=3Dy
 CONFIG_REGULATOR_MAX8973=3Dy
 CONFIG_REGULATOR_PFUZE100=3Dy
 CONFIG_REGULATOR_PWM=3Dy
-CONFIG_REGULATOR_QCOM_RPMH=3Dy
+CONFIG_REGULATOR_QCOM_RPMH=3Dm
 CONFIG_REGULATOR_QCOM_SMD_RPM=3Dy
 CONFIG_REGULATOR_QCOM_SPMI=3Dy
 CONFIG_REGULATOR_RK808=3Dy
@@ -598,11 +591,7 @@ CONFIG_RC_DEVICES=3Dy
 CONFIG_IR_MESON=3Dm
 CONFIG_IR_SUNXI=3Dm
 CONFIG_MEDIA_SUPPORT=3Dy
-CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
-CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
-CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
-CONFIG_MEDIA_CONTROLLER=3Dy
-CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
+CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
 # CONFIG_DVB_NET is not set
 CONFIG_MEDIA_USB_SUPPORT=3Dy
 CONFIG_USB_VIDEO_CLASS=3Dm
@@ -614,7 +603,6 @@ CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
 CONFIG_VIDEO_RENESAS_FCP=3Dm
 CONFIG_VIDEO_RENESAS_VSP1=3Dm
-CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
 CONFIG_DRM=3Dy
 CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
 CONFIG_DRM_I2C_CH7006=3Dm
@@ -657,7 +645,6 @@ CONFIG_DRM_PANFROST=3Dm
 CONFIG_DRM_LEGACY=3Dy
 CONFIG_FB_MODE_HELPERS=3Dy
 CONFIG_FB_EFI=3Dy
-CONFIG_BACKLIGHT_GENERIC=3Dm
 CONFIG_BACKLIGHT_PWM=3Dm
 CONFIG_BACKLIGHT_LP855X=3Dm
 CONFIG_FRAMEBUFFER_CONSOLE=3Dy
@@ -699,7 +686,6 @@ CONFIG_HID_REDRAGON=3Dy
 CONFIG_HID_MICROSOFT=3Dy
 CONFIG_HID_MONTEREY=3Dy
 CONFIG_I2C_HID=3Dm
-CONFIG_USB_CONN_GPIO=3Dm
 CONFIG_USB=3Dy
 CONFIG_USB_OTG=3Dy
 CONFIG_USB_XHCI_HCD=3Dy
@@ -775,7 +761,6 @@ CONFIG_RTC_DRV_RX8581=3Dm
 CONFIG_RTC_DRV_S5M=3Dy
 CONFIG_RTC_DRV_DS3232=3Dy
 CONFIG_RTC_DRV_EFI=3Dy
-CONFIG_RTC_DRV_CROS_EC=3Dy
 CONFIG_RTC_DRV_S3C=3Dy
 CONFIG_RTC_DRV_PL031=3Dy
 CONFIG_RTC_DRV_SUN6I=3Dy
@@ -811,9 +796,7 @@ CONFIG_STAGING=3Dy
 CONFIG_ASHMEM=3Dy
 CONFIG_ION=3Dy
 CONFIG_ION_SYSTEM_HEAP=3Dy
-CONFIG_MFD_CROS_EC=3Dy
-CONFIG_CROS_EC_I2C=3Dy
-CONFIG_CROS_EC_SPI=3Dy
+CONFIG_ION_CMA_HEAP=3Dy
 CONFIG_COMMON_CLK_RK808=3Dy
 CONFIG_COMMON_CLK_SCMI=3Dy
 CONFIG_COMMON_CLK_SCPI=3Dy
@@ -831,7 +814,7 @@ CONFIG_COMMON_CLK_QCOM=3Dy
 CONFIG_QCOM_A53PLL=3Dy
 CONFIG_QCOM_CLK_APCS_MSM8916=3Dy
 CONFIG_QCOM_CLK_SMD_RPM=3Dy
-CONFIG_QCOM_CLK_RPMH=3Dy
+CONFIG_QCOM_CLK_RPMH=3Dm
 CONFIG_IPQ_GCC_8074=3Dy
 CONFIG_MSM_GCC_8916=3Dy
 CONFIG_MSM_GCC_8994=3Dy
@@ -862,26 +845,24 @@ CONFIG_RPMSG_QCOM_GLINK_SMEM=3Dm
 CONFIG_RPMSG_QCOM_SMD=3Dy
 CONFIG_OWL_PM_DOMAINS=3Dy
 CONFIG_RASPBERRYPI_POWER=3Dy
-CONFIG_IMX_SCU_SOC=3Dy
 CONFIG_QCOM_AOSS_QMP=3Dy
 CONFIG_QCOM_GENI_SE=3Dy
-CONFIG_QCOM_GLINK_SSR=3Dm
 CONFIG_QCOM_RMTFS_MEM=3Dm
-CONFIG_QCOM_RPMH=3Dy
-CONFIG_QCOM_RPMHPD=3Dy
+CONFIG_QCOM_RPMH=3Dm
+CONFIG_QCOM_RPMHPD=3Dm
 CONFIG_QCOM_SMEM=3Dy
 CONFIG_QCOM_SMD_RPM=3Dy
 CONFIG_QCOM_SMP2P=3Dy
 CONFIG_QCOM_SMSM=3Dy
 CONFIG_QCOM_SOCINFO=3Dm
-CONFIG_ARCH_R8A774A1=3Dy
-CONFIG_ARCH_R8A774C0=3Dy
-CONFIG_ARCH_R8A7795=3Dy
+CONFIG_ARCH_R8A77995=3Dy
+CONFIG_ARCH_R8A77990=3Dy
 CONFIG_ARCH_R8A77965=3Dy
-CONFIG_ARCH_R8A77970=3Dy
 CONFIG_ARCH_R8A77980=3Dy
-CONFIG_ARCH_R8A77990=3Dy
-CONFIG_ARCH_R8A77995=3Dy
+CONFIG_ARCH_R8A77970=3Dy
+CONFIG_ARCH_R8A774C0=3Dy
+CONFIG_ARCH_R8A774A1=3Dy
+CONFIG_ROCKCHIP_IODOMAIN=3Dy
 CONFIG_ROCKCHIP_PM_DOMAINS=3Dy
 CONFIG_ARCH_TEGRA_132_SOC=3Dy
 CONFIG_ARCH_TEGRA_210_SOC=3Dy
@@ -891,21 +872,15 @@ CONFIG_ARCH_K3_AM6_SOC=3Dy
 CONFIG_ARCH_K3_J721E_SOC=3Dy
 CONFIG_TI_SCI_PM_DOMAINS=3Dy
 CONFIG_EXTCON_USB_GPIO=3Dy
-CONFIG_EXTCON_USBC_CROS_EC=3Dy
 CONFIG_MEMORY=3Dy
 CONFIG_IIO=3Dy
 CONFIG_EXYNOS_ADC=3Dy
 CONFIG_QCOM_SPMI_ADC5=3Dm
 CONFIG_ROCKCHIP_SARADC=3Dm
-CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dm
-CONFIG_IIO_CROS_EC_SENSORS=3Dm
-CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dm
 CONFIG_SENSORS_ISL29018=3Dm
-CONFIG_IIO_CROS_EC_BARO=3Dm
 CONFIG_MPL3115=3Dm
 CONFIG_PWM=3Dy
 CONFIG_PWM_BCM2835=3Dm
-CONFIG_PWM_CROS_EC=3Dm
 CONFIG_PWM_MESON=3Dm
 CONFIG_PWM_RCAR=3Dm
 CONFIG_PWM_ROCKCHIP=3Dy
@@ -937,9 +912,9 @@ CONFIG_PHY_UNIPHIER_USB3=3Dy
 CONFIG_PHY_TEGRA_XUSB=3Dy
 CONFIG_ARM_SMMU_V3_PMU=3Dm
 CONFIG_FSL_IMX8_DDR_PMU=3Dm
-CONFIG_HISI_PMU=3Dy
 CONFIG_QCOM_L2_PMU=3Dy
 CONFIG_QCOM_L3_PMU=3Dy
+CONFIG_HISI_PMU=3Dy
 CONFIG_ANDROID=3Dy
 CONFIG_ANDROID_BINDER_IPC=3Dy
 CONFIG_NVMEM_IMX_OCOTP=3Dy
@@ -995,8 +970,8 @@ CONFIG_CRYPTO_DEV_HISI_ZIP=3Dm
 CONFIG_CMA_SIZE_MBYTES=3D256
 CONFIG_PRINTK_TIME=3Dy
 CONFIG_DEBUG_INFO=3Dy
-CONFIG_DEBUG_FS=3Dy
 CONFIG_MAGIC_SYSRQ=3Dy
+CONFIG_DEBUG_FS=3Dy
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0003=
-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0003-mailbox-arm_mhuv2-add-dev=
ice-tree-binding-documentat.patch
deleted file mode 100644
index 060be39..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0003-mailbo=
x-arm_mhuv2-add-device-tree-binding-documentat.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From bca81c4c54765565651634b6de5edb6a191577a3 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Thu, 27 Jun 2019 11:16:22 +0100
-Subject: [PATCH 3/9] mailbox: arm_mhuv2: add device tree binding documenta=
tion
-
-This patch adds device tree binding for Message Handling Unit
-controller version 2 from Arm.
-
-Change-Id: I8c46dd7cd1a48450020c33721ea7cce9f8b8e64f
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Cc: robh+dt@kernel.org
-Cc: mark.rutland@arm.com
-Cc: devicetree@vger.kernel.org
-Cc: jassisinghbrar@gmail.com
-
-Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
----
- .../devicetree/bindings/mailbox/arm,mhuv2.txt | 101 ++++++++++++++++++
- 1 file changed, 101 insertions(+)
- create mode 100644 Documentation/devicetree/bindings/mailbox/arm,mhuv2.tx=
t
-
-diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt b/Doc=
umentation/devicetree/bindings/mailbox/arm,mhuv2.txt
-new file mode 100644
-index 000000000000..5b8a2ab21ae0
---- /dev/null
-+++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
-@@ -0,0 +1,101 @@
-+Arm MHUv2 Mailbox Driver
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+The Arm Message-Handling-Unit (MHU) Version 2 is a mailbox controller tha=
t has
-+between 1 and 124 channel windows to provide unidirectional communication=
 with
-+remote processor(s).
-+
-+Given the unidirectional nature of the device, an MHUv2 mailbox may only =
be
-+written to or read from. If a pair of MHU devices is implemented between =
two
-+processing elements to provide bidirectional communication, these must be
-+specified as two separate mailboxes.
-+
-+If the interrupts property is present in device tree node, then its treat=
ed
-+as a receiver frame, otherwise a sender frame.
-+
-+An MHU device must be specified with a transport protocol. The transport
-+protocol of an MHU device determines the method of data transmission as w=
ell as
-+the number of provided mailboxes.
-+Following are the possible transport protocol types:
-+- Single-word:	An MHU device implements as many mailboxes as it
-+		provides channel windows. Data is transmitted through
-+		the MHU registers.
-+- Multi-word:	An MHU device implements a single mailbox. All channel wind=
ows
-+		will be used during transmission. Data is transmitted through
-+		the MHU registers.
-+- Doorbell:	An MHU device implements as many mailboxes as there are flag
-+		bits available in its channel windows. Optionally, data may
-+		be transmitted through a shared memory region, wherein the MHU
-+		is used strictly as an interrupt generation mechanism.
-+
-+Mailbox Device Node:
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+Required properties:
-+--------------------
-+- compatible:	Shall be "arm,mhuv2" & "arm,primecell"
-+- reg:		Contains the mailbox register address range (base
-+		address and length)
-+- #mbox-cells	Shall be 1 - the index of the channel needed.
-+- mhu-protocol	Transport protocol of the device. Shall be one of the
-+		following: "single-word", "multi-word", "doorbell"
-+
-+Required properties (receiver frame):
-+-------------------------------------
-+- interrupts:	Contains the interrupt information for the receiver frame
-+
-+Example:
-+--------
-+
-+	mbox_mw_tx: mhu@10000000 {
-+		compatible =3D "arm,mhuv2","arm,primecell";
-+		reg =3D <0x10000000 0x1000>;
-+		clocks =3D <&refclk100mhz>;
-+		clock-names =3D "apb_pclk";
-+		#mbox-cells =3D <1>;
-+		mhu-protocol =3D "multi-word";
-+	};
-+
-+	mbox_sw_tx: mhu@10000000 {
-+		compatible =3D "arm,mhuv2","arm,primecell";
-+		reg =3D <0x11000000 0x1000>;
-+		clocks =3D <&refclk100mhz>;
-+		clock-names =3D "apb_pclk";
-+		#mbox-cells =3D <1>;
-+		mhu-protocol =3D "single-word";
-+	};
-+
-+	mbox_db_rx: mhu@10000000 {
-+		compatible =3D "arm,mhuv2","arm,primecell";
-+		reg =3D <0x12000000 0x1000>;
-+		clocks =3D <&refclk100mhz>;
-+		clock-names =3D "apb_pclk";
-+		#mbox-cells =3D <1>;
-+		interrupts =3D <0 45 4>;
-+		interrupt-names =3D "mhu_rx";
-+		mhu-protocol =3D "doorbell";
-+	};
-+
-+	mhu_client: scb@2e000000 {
-+	compatible =3D "fujitsu,mb86s70-scb-1.0";
-+	reg =3D <0 0x2e000000 0x4000>;
-+	mboxes =3D
-+		// For multi-word frames, client may only instantiate a single
-+		// mailbox for a mailbox controller
-+		<&mbox_mw_tx 0>,
-+
-+		// For single-word frames, client may instantiate as many
-+		// mailboxes as there are channel windows in the MHU
-+		 <&mbox_sw_tx 0>,
-+		 <&mbox_sw_tx 1>,
-+		 <&mbox_sw_tx 2>,
-+		 <&mbox_sw_tx 3>,
-+
-+		// For doorbell frames, client may instantiate as many mailboxes
-+		// as there are bits available in the combined number of channel
-+		// windows ((channel windows * 32) mailboxes)
-+		 <mbox_db_rx 0>,
-+		 <mbox_db_rx 1>,
-+		 ...
-+		 <mbox_db_rx 17>;
-+	};
-\ No newline at end of file
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0004=
-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.4/tc0/0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.=
patch
deleted file mode 100644
index f357935..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0004-mailbo=
x-arm_mhuv2-add-arm-mhuv2-driver.patch
+++ /dev/null
@@ -1,822 +0,0 @@
-From 364539028799290814a35aa10d32d850486f0b4a Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Thu, 27 Jun 2019 11:17:14 +0100
-Subject: [PATCH 4/9] mailbox: arm_mhuv2: add arm mhuv2 driver
-
-This commit adds a driver for the ARM MHUv2 (Message Handling Unit).
-The driver registers itself as a mailbox controller within the common
-mailbox framework.
-
-This commit implements the single-word transport protocol;
-In single-word mode, the mailbox controller will provide a mailbox for eac=
h
-channel window available in the MHU device.
-Transmitting and receiving data through the mailbox framework in
-single-word mode is done through a struct arm_mbox_msg.
-
-Change-Id: I718253ceb902a2d53f7199a746063a36129b0fa6
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Cc: jassisinghbrar@gmail.com
-Cc: devicetree@vger.kernel.org
-
-Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
----
- drivers/mailbox/Kconfig                  |   7 +
- drivers/mailbox/Makefile                 |   2 +
- drivers/mailbox/arm_mhu_v2.c             | 707 +++++++++++++++++++++++
- include/linux/mailbox/arm-mbox-message.h |  37 ++
- 4 files changed, 753 insertions(+)
- create mode 100644 drivers/mailbox/arm_mhu_v2.c
- create mode 100644 include/linux/mailbox/arm-mbox-message.h
-
-diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
-index ab4eb750bbdd..0a0dce01098c 100644
---- a/drivers/mailbox/Kconfig
-+++ b/drivers/mailbox/Kconfig
-@@ -22,6 +22,13 @@ config IMX_MBOX
- 	help
- 	  Mailbox implementation for i.MX Messaging Unit (MU).
-=20
-+config ARM_MHU_V2
-+	tristate "ARM MHUv2 Mailbox"
-+	depends on ARM_AMBA
-+	help
-+	  Say Y here if you want to build the ARM MHUv2 controller driver,
-+	  which provides unidirectional mailboxes between processing elements.
-+
- config PLATFORM_MHU
- 	tristate "Platform MHU Mailbox"
- 	depends on OF
-diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
-index c22fad6f696b..78377f459421 100644
---- a/drivers/mailbox/Makefile
-+++ b/drivers/mailbox/Makefile
-@@ -11,6 +11,8 @@ obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
-=20
- obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+=3D armada-37xx-rwtm-mailbox.o
-=20
-+obj-$(CONFIG_ARM_MHU_V2)	+=3D arm_mhu_v2.o
-+
- obj-$(CONFIG_PLATFORM_MHU)	+=3D platform_mhu.o
-=20
- obj-$(CONFIG_PL320_MBOX)	+=3D pl320-ipc.o
-diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
-new file mode 100644
-index 000000000000..d809076eb47b
---- /dev/null
-+++ b/drivers/mailbox/arm_mhu_v2.c
-@@ -0,0 +1,707 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Arm Message Handling Unit Version 2 (MHUv2) driver
-+ *
-+ * An MHU device may function in one of three transport protocol modes
-+ * (single-word, multi-word and doorbell).
-+ * This transport protocol should be specified in the device tree entry f=
or the
-+ * device. The transport protocol determines how the underlying hardware
-+ * resources of the device are utilized when transmitting data.
-+ *
-+ * The arm MHUv2 driver registers as a mailbox controller with the common
-+ * mailbox framework. Each mailbox channel represents a separate virtual
-+ * communication channel through the MHU device.
-+ * The number of registered mailbox channels is dependent on both the
-+ * underlying hardware - mainly the number of channel windows within each=
 MHU
-+ * frame, as well as the selected transport protocol.
-+ *
-+ * Copyright (C) 2019 Arm Ltd.
-+ */
-+
-+#include <linux/slab.h>
-+#include <linux/module.h>
-+#include <linux/amba/bus.h>
-+#include <linux/mailbox_controller.h>
-+#include <linux/mailbox/arm-mbox-message.h>
-+#include <linux/of_address.h>
-+#include <linux/interrupt.h>
-+
-+/* Maximum number of channel windows */
-+#define MHUV2_CHANNEL_MAX 124
-+/* Number of combined interrupt status registers */
-+#define MHUV2_CMB_INT_ST_REG_CNT 4
-+#define MHUV2_CH_UNKNOWN -1
-+
-+/* Channel window status register type */
-+typedef u32 mhuv2_stat_reg_t;
-+#define MHUV2_STAT_BYTES sizeof(mhuv2_stat_reg_t)
-+#define MHUV2_STAT_BITS (MHUV2_STAT_BYTES * __CHAR_BIT__)
-+
-+#define LSB_MASK(n) ((1 << (n)) - 1)
-+
-+#ifndef PAD
-+#define _PADLINE(line) pad##line
-+#define _XSTR(line) _PADLINE(line)
-+#define PAD _XSTR(__LINE__)
-+#endif
-+
-+/* =3D=3D=3D=3D=3D=3D Arm MHUv2 register defines =3D=3D=3D=3D=3D=3D */
-+
-+/* Register Message Handling Unit Configuration fields */
-+struct MHU_CFG_t {
-+	u32 NUM_CH : 7;
-+	u32 PAD : 25;
-+} __packed;
-+
-+/* Register Implementer Identification fields */
-+struct IIDR_t {
-+	u32 IMPLEMENTER : 12;
-+	u32 REVISION : 4;
-+	u32 VARIANT : 4;
-+	u32 PRODUCT_ID : 12;
-+} __packed;
-+
-+/* Register Architecture Identification Register fields */
-+struct AIDR_t {
-+	u32 ARCH_MINOR_REV : 4;
-+	u32 ARCH_MAJOR_REV : 4;
-+	u32 PAD : 24;
-+} __packed;
-+
-+/* register Interrupt Status fields */
-+struct INT_ST_t {
-+	u32 NR2R : 1;
-+	u32 R2NR : 1;
-+	u32 PAD : 30;
-+} __packed;
-+
-+/* Register Interrupt Clear fields */
-+struct INT_CLR_t {
-+	u32 NR2R : 1;
-+	u32 R2NR : 1;
-+	u32 PAD : 30;
-+} __packed;
-+
-+/* Register Interrupt Enable fields */
-+struct INT_EN_t {
-+	u32 R2NR : 1;
-+	u32 NR2R : 1;
-+	u32 CHCOMB : 1;
-+	u32 PAD : 29;
-+} __packed;
-+
-+/* Sender Channel Window fields */
-+struct mhu2_send_channel_reg {
-+	mhuv2_stat_reg_t STAT;
-+	u8 PAD[0xC - 0x4];
-+	mhuv2_stat_reg_t STAT_SET;
-+	u8 PAD[0x20 - 0x10];
-+} __packed;
-+
-+/* Sender frame register fields */
-+struct mhu2_send_frame_reg {
-+	struct mhu2_send_channel_reg channel[MHUV2_CHANNEL_MAX];
-+	struct MHU_CFG_t MHU_CFG;
-+	u32 RESP_CFG;
-+	u32 ACCESS_REQUEST;
-+	u32 ACCESS_READY;
-+	struct INT_ST_t INT_ST;
-+	struct INT_CLR_t INT_CLR;
-+	struct INT_EN_t INT_EN;
-+	u32 RESERVED0;
-+	u32 CHCOMB_INT_ST[MHUV2_CMB_INT_ST_REG_CNT];
-+	u8 PAD[0xFC8 - 0xFB0];
-+	struct IIDR_t IIDR;
-+	struct AIDR_t AIDR;
-+} __packed;
-+
-+/* Receiver Channel Window fields */
-+struct mhu2_recv_channel_reg {
-+	mhuv2_stat_reg_t STAT;
-+	mhuv2_stat_reg_t STAT_PEND;
-+	mhuv2_stat_reg_t STAT_CLEAR;
-+	u8 RESERVED0[0x10 - 0x0C];
-+	mhuv2_stat_reg_t MASK;
-+	mhuv2_stat_reg_t MASK_SET;
-+	mhuv2_stat_reg_t MASK_CLEAR;
-+	u8 PAD[0x20 - 0x1C];
-+} __packed;
-+
-+/* Receiver frame register fields */
-+struct mhu2_recv_frame_reg {
-+	struct mhu2_recv_channel_reg channel[MHUV2_CHANNEL_MAX];
-+	struct MHU_CFG_t MHU_CFG;
-+	u8 RESERVED0[0xF90 - 0xF84];
-+	struct INT_ST_t INT_ST;
-+	struct INT_CLR_t INT_CLR;
-+	struct INT_EN_t INT_EN;
-+	u32 PAD;
-+	mhuv2_stat_reg_t CHCOMB_INT_ST[MHUV2_CMB_INT_ST_REG_CNT];
-+	u8 RESERVED2[0xFC8 - 0xFB0];
-+	struct IIDR_t IIDR;
-+	struct AIDR_t AIDR;
-+} __packed;
-+
-+/* =3D=3D=3D=3D=3D=3D Arm MHUv2 device tree property identifiers =3D=3D=
=3D=3D=3D=3D */
-+
-+static const char *const mhuv2_protocol_dt_identifiers[] =3D { "single-wo=
rd",
-+							     "multi-word",
-+							     "doorbell" };
-+
-+static const char *const mhuv2_frame_dt_identifiers[] =3D { "receiver",
-+							  "sender" };
-+
-+/* =3D=3D=3D=3D=3D=3D Arm MHUv2 data structures =3D=3D=3D=3D=3D=3D */
-+
-+enum mhuv2_transport_protocol { SINGLE_WORD, MULTI_WORD, DOORBELL };
-+
-+enum mhuv2_frame { RECEIVER_FRAME, SENDER_FRAME };
-+
-+/**
-+ * Arm MHUv2 operations
-+ *
-+ * Each transport protocol must provide an implementation of the operatio=
ns
-+ * presented in this structure.
-+ * Most operations present a struct mbox_chan* as argument. This channel =
will
-+ * correspond to one of the virtual channels within the MHU device. What
-+ * constitutes a channel within the MHU device is dependent on the transp=
ort
-+ * protocol.
-+ */
-+struct arm_mhuv2;
-+struct mhuv2_ops {
-+	int (*read_data)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan,
-+			 struct arm_mbox_msg *msg);
-+	int (*clear_data)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan,
-+			  struct arm_mbox_msg *msg);
-+	int (*send_data)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan,
-+			 const struct arm_mbox_msg *msg);
-+	int (*setup)(struct arm_mhuv2 *mhuv2);
-+	int (*last_tx_done)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan);
-+	struct mbox_chan *(*get_active_mbox_chan)(struct arm_mhuv2 *mhuv2);
-+};
-+
-+/**
-+ * Arm MHUv2 mailbox channel information
-+ *
-+ * A channel contains a notion of its index within the array of mailbox c=
hannels
-+ * which a mailbox controller allocates.
-+ */
-+struct arm_mhuv2_mbox_chan_priv {
-+	u32 ch_idx;
-+};
-+
-+#define mhuv2_chan_idx(_chanptr)                                         =
      \
-+	(((struct arm_mhuv2_mbox_chan_priv *)(_chanptr)->con_priv)->ch_idx)
-+
-+/**
-+ * Arm MHUv2 mailbox controller data
-+ *
-+ * @reg:	Base address of the register mapping region
-+ * @protocol:	Transport protocol, derived from device tree
-+ * @frame:	Frame type, derived from device tree
-+ * @irq:	Interrupt, only valid for receiver frames
-+ * @mbox:	Mailbox controller belonging to the MHU frame
-+ * @ops:	Pointer to transport-protocol specific operations
-+ * @dev:	Device to which it is attached
-+ */
-+struct arm_mhuv2 {
-+	union {
-+		struct mhu2_send_frame_reg __iomem *send;
-+		struct mhu2_recv_frame_reg __iomem *recv;
-+	} reg;
-+	enum mhuv2_frame frame;
-+	unsigned int irq;
-+	struct mbox_controller mbox;
-+	struct mhuv2_ops *ops;
-+	struct device *dev;
-+};
-+
-+#define mhu2_from_mbox_ctrl(_mbox) container_of(_mbox, struct arm_mhuv2, =
mbox)
-+#define mhu2_from_mbox_chan(_chan) mhu2_from_mbox_ctrl(_chan->mbox)
-+
-+/* Macro for reading a bitfield within a physically mapped packed struct =
*/
-+#define readl_relaxed_bitfield(_regptr, _field)                          =
      \
-+	({                                                                     \
-+		mhuv2_stat_reg_t _regval;                                      \
-+		BUILD_BUG_ON(sizeof(*(_regptr)) > sizeof(typeof(_regval)));    \
-+		_regval =3D readl_relaxed((_regptr));                            \
-+		(*(typeof((_regptr)))(&_regval))._field;                       \
-+	})
-+
-+/* Macro for writing a bitfield within a physically mapped packed struct =
*/
-+#define writel_relaxed_bitfield(_value, _regptr, _field)                 =
      \
-+	({                                                                     \
-+		mhuv2_stat_reg_t _regval;                                      \
-+		BUILD_BUG_ON(sizeof(*_regptr) > sizeof(typeof(_regval)));      \
-+		_regval =3D readl_relaxed(_regptr);                              \
-+		(*(typeof(_regptr))(&_regval))._field =3D _value;                \
-+		writel_relaxed(_regval, _regptr);                              \
-+	})
-+
-+static inline int __find_set_bit(uint32_t val)
-+{
-+	const uint32_t trailing_zeros =3D __builtin_ctz(val);
-+	return trailing_zeros =3D=3D 32 ? -1 : trailing_zeros;
-+}
-+
-+/**
-+ * Get index of a set bit within the combined interrupt status registers
-+ *
-+ * The function will calculate the index being the offset from the LSB of=
 the
-+ * first combined interrupt status register.
-+ *
-+ */
-+static inline int mhuv2_combint_idx(struct arm_mhuv2 *mhuv2)
-+{
-+	int ch_idx =3D 0;
-+	int set_bit_index, reg_idx;
-+
-+	for (reg_idx =3D 0; reg_idx < MHUV2_CMB_INT_ST_REG_CNT; reg_idx++) {
-+		mhuv2_stat_reg_t stat_reg;
-+
-+		stat_reg =3D
-+			readl_relaxed(&mhuv2->reg.recv->CHCOMB_INT_ST[reg_idx]);
-+		set_bit_index =3D __find_set_bit(stat_reg);
-+		if (set_bit_index =3D=3D -1) {
-+			ch_idx +=3D MHUV2_STAT_BITS;
-+		} else {
-+			ch_idx +=3D set_bit_index;
-+			break;
-+		}
-+	}
-+	return (ch_idx >=3D (MHUV2_CMB_INT_ST_REG_CNT * MHUV2_STAT_BITS) ?
-+			MHUV2_CH_UNKNOWN :
-+			ch_idx);
-+}
-+
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Single word transport=
 protocol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
-+static inline int mhuv20_get_non_zero_ch_idx(struct arm_mhuv2 *mhuv2)
-+{
-+	/* Locate a channel window with a non-zero STAT register */
-+	int ch_idx;
-+	int ch =3D MHUV2_CH_UNKNOWN;
-+
-+	for (ch_idx =3D 0;
-+	     ch_idx < readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
-+	     ch_idx++) {
-+		if (readl_relaxed(&mhuv2->reg.recv->channel[ch_idx].STAT)) {
-+			ch =3D ch_idx;
-+			break;
-+		}
-+	}
-+	return ch;
-+}
-+
-+static inline int mhuv2_get_non_zero_ch_idx(struct arm_mhuv2 *mhuv2)
-+{
-+	/* Identify index of channel window containing non-zero data */
-+	switch (readl_relaxed_bitfield(&mhuv2->reg.recv->AIDR,
-+				       ARCH_MINOR_REV)) {
-+	case 1:
-+		return mhuv2_combint_idx(mhuv2);
-+	default:
-+		return mhuv20_get_non_zero_ch_idx(mhuv2);
-+	}
-+}
-+
-+static inline int mhuv2_read_data_single_word(struct arm_mhuv2 *mhuv2,
-+					      struct mbox_chan *chan,
-+					      struct arm_mbox_msg *msg)
-+{
-+	const u32 ch_idx =3D mhuv2_chan_idx(chan);
-+
-+	msg->data =3D kzalloc(MHUV2_STAT_BYTES, GFP_KERNEL);
-+	if (!msg->data)
-+		return -ENOMEM;
-+
-+	*(mhuv2_stat_reg_t *)msg->data =3D
-+		readl_relaxed(&mhuv2->reg.recv->channel[ch_idx].STAT);
-+	msg->len =3D MHUV2_STAT_BYTES;
-+	return 0;
-+}
-+
-+static inline int mhuv2_clear_data_single_word(struct arm_mhuv2 *mhuv2,
-+					       struct mbox_chan *chan,
-+					       struct arm_mbox_msg *msg)
-+{
-+	const u32 ch_idx =3D mhuv2_chan_idx(chan);
-+
-+	writel_relaxed(readl_relaxed(&mhuv2->reg.recv->channel[ch_idx].STAT),
-+		       &mhuv2->reg.recv->channel[ch_idx].STAT_CLEAR);
-+	return 0;
-+}
-+
-+static inline int mhuv2_send_data_single_word(struct arm_mhuv2 *mhuv2,
-+					      struct mbox_chan *chan,
-+					      const struct arm_mbox_msg *msg)
-+{
-+	const u32 ch_idx =3D mhuv2_chan_idx(chan);
-+	int bytes_left =3D msg->len;
-+	char *data =3D msg->data;
-+
-+	if (ch_idx >=3D readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH=
))
-+		return -ENODEV;
-+
-+	while (bytes_left > 0) {
-+		mhuv2_stat_reg_t word =3D *(mhuv2_stat_reg_t *)(data);
-+
-+		if (bytes_left < MHUV2_STAT_BYTES)
-+			word &=3D LSB_MASK(bytes_left * __CHAR_BIT__);
-+
-+		if (!word) {
-+			dev_err(mhuv2->dev,
-+				"Data transmitted in single-word mode must be non-zero\n");
-+			return -EINVAL;
-+		}
-+		writel_relaxed(word,
-+			       &mhuv2->reg.send->channel[ch_idx].STAT_SET);
-+		while (readl_relaxed(&mhuv2->reg.send->channel[ch_idx].STAT))
-+			continue;
-+		bytes_left -=3D MHUV2_STAT_BYTES;
-+		data +=3D MHUV2_STAT_BYTES;
-+	}
-+
-+	return 0;
-+}
-+
-+static inline int mhuv2_last_tx_done_single_word(struct arm_mhuv2 *mhuv2,
-+						 struct mbox_chan *chan)
-+{
-+	const u32 ch_idx =3D mhuv2_chan_idx(chan);
-+
-+	return readl_relaxed(&mhuv2->reg.send->channel[ch_idx].STAT) =3D=3D 0;
-+}
-+
-+static inline int mhuv2_setup_single_word(struct arm_mhuv2 *mhuv2)
-+{
-+	int i;
-+	const u32 channel_windows =3D
-+		readl_relaxed_bitfield(mhuv2->frame =3D=3D RECEIVER_FRAME ?
-+					       &mhuv2->reg.recv->MHU_CFG :
-+					       &mhuv2->reg.send->MHU_CFG,
-+				       NUM_CH);
-+
-+	mhuv2->mbox.num_chans =3D channel_windows;
-+	mhuv2->mbox.chans =3D
-+		devm_kzalloc(mhuv2->dev,
-+			     mhuv2->mbox.num_chans * sizeof(struct mbox_chan),
-+			     GFP_KERNEL);
-+
-+	for (i =3D 0; i < mhuv2->mbox.num_chans; i++) {
-+		mhuv2->mbox.chans[i].con_priv =3D
-+			devm_kzalloc(mhuv2->dev,
-+				     sizeof(struct arm_mhuv2_mbox_chan_priv),
-+				     GFP_KERNEL);
-+		mhuv2_chan_idx(&mhuv2->mbox.chans[i]) =3D i;
-+	}
-+
-+	if (mhuv2->frame =3D=3D RECEIVER_FRAME) {
-+		/* Ensure all status registers are unmasked */
-+		for (i =3D 0; i < channel_windows; i++) {
-+			writel_relaxed(0x0,
-+				       &mhuv2->reg.recv->channel[i].MASK_SET);
-+		}
-+	}
-+
-+	return 0;
-+}
-+
-+static inline struct mbox_chan *
-+	mhuv2_get_active_mbox_chan_single_word(struct arm_mhuv2 *mhuv2)
-+{
-+	const u32 ch_idx =3D mhuv2_get_non_zero_ch_idx(mhuv2);
-+
-+	if (ch_idx >=3D mhuv2->mbox.num_chans) {
-+		dev_err(mhuv2->dev,
-+			"Invalid active channel in single word mode\n");
-+		return ERR_PTR(-EINVAL);
-+	}
-+	return &mhuv2->mbox.chans[ch_idx];
-+}
-+
-+static const struct mhuv2_ops mhuv2_single_word_ops =3D {
-+	.read_data =3D mhuv2_read_data_single_word,
-+	.clear_data =3D mhuv2_clear_data_single_word,
-+	.send_data =3D mhuv2_send_data_single_word,
-+	.setup =3D mhuv2_setup_single_word,
-+	.last_tx_done =3D mhuv2_last_tx_done_single_word,
-+	.get_active_mbox_chan =3D mhuv2_get_active_mbox_chan_single_word,
-+};
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
-+
-+/*
-+ * MHUv2 receiver interrupt service routine
-+ *
-+ * This routine will be called whenever a reception interrupt is raised o=
n the
-+ * MHU device. Given that an MHU device may manage multiple mailboxes, it=
 is
-+ * up to the protocol-specific operations to determine:
-+ * - What is the active mailbox channel
-+ * - Read the data within the MHU corresponding to the channel
-+ * - Clear the data within the MHU corresponding to the channel
-+ *
-+ * These operations must also ensure to not overwrite any data which may =
belong
-+ * to a different mailbox channel. For instance, if data is received in t=
wo
-+ * channel windows in single-word mode, the ISR will read and clear the d=
ata
-+ * from one of these channel windows within a pass. This will result in a=
 status
-+ * register being non-zero upon returning from this routine, which in tur=
n
-+ * will keep the interrupt asserted for a second round.
-+ */
-+static irqreturn_t mhuv2_rx_interrupt(int irq, void *data)
-+{
-+	struct arm_mbox_msg msg;
-+	int status;
-+	struct arm_mhuv2 *mhuv2 =3D data;
-+	struct mbox_chan *chan =3D mhuv2->ops->get_active_mbox_chan(mhuv2);
-+
-+	msg.data =3D NULL;
-+	msg.len =3D 0;
-+
-+	status =3D mhuv2->ops->read_data(mhuv2, chan, &msg);
-+	if (status !=3D 0)
-+		goto rx_exit;
-+
-+	if (!chan->cl) {
-+		dev_warn(
-+			mhuv2->dev,
-+			"Warning: Received data on channel not currently attached to "
-+			 "a mailbox client\n");
-+	} else {
-+		mbox_chan_received_data(chan, (void *)&msg);
-+	}
-+
-+	status =3D mhuv2->ops->clear_data(mhuv2, chan, &msg);
-+
-+rx_exit:
-+	kfree(msg.data);
-+
-+	return status =3D=3D 0 ? IRQ_HANDLED : IRQ_NONE;
-+}
-+
-+static bool mhuv2_last_tx_done(struct mbox_chan *chan)
-+{
-+	struct arm_mhuv2 *mhuv2 =3D mhu2_from_mbox_chan(chan);
-+
-+	return mhuv2->ops->last_tx_done(mhuv2, chan);
-+}
-+
-+static int mhuv2_send_data(struct mbox_chan *chan, void *data)
-+{
-+	struct arm_mhuv2 *mhuv2 =3D mhu2_from_mbox_chan(chan);
-+	struct arm_mbox_msg *msg =3D data;
-+	int ret;
-+
-+	if (!mhuv2->ops->last_tx_done(mhuv2, chan))
-+		return -EBUSY;
-+
-+	ret =3D mhuv2->ops->send_data(mhuv2, chan, msg);
-+	return ret;
-+}
-+
-+static int mhuv2_startup(struct mbox_chan *chan)
-+{
-+	struct arm_mhuv2 *mhuv2 =3D mhu2_from_mbox_ctrl(chan->mbox);
-+
-+	writel_relaxed(0x1, &mhuv2->reg.send->ACCESS_REQUEST);
-+	while (!readl_relaxed(&mhuv2->reg.send->ACCESS_READY))
-+		continue;
-+
-+	return 0;
-+}
-+
-+static void mhuv2_shutdown(struct mbox_chan *chan)
-+{
-+	struct arm_mhuv2 *mhuv2 =3D mhu2_from_mbox_ctrl(chan->mbox);
-+
-+	writel_relaxed(0x0, &mhuv2->reg.send->ACCESS_REQUEST);
-+}
-+
-+static int mhuv2_recv_startup(struct mbox_chan *chan)
-+{
-+	return 0;
-+}
-+
-+static void mhuv2_recv_shutdown(struct mbox_chan *chan)
-+{
-+}
-+
-+static int mhuv2_recv_send_data(struct mbox_chan *chan, void *data)
-+{
-+	dev_err(chan->mbox->dev,
-+		"Trying to transmit on a receiver MHU frame\n");
-+	return -EIO;
-+}
-+
-+static bool mhuv2_recv_last_tx_done(struct mbox_chan *chan)
-+{
-+	dev_err(chan->mbox->dev, "Trying to Tx poll on a receiver MHU frame\n");
-+	return true;
-+}
-+
-+static const struct mbox_chan_ops mhuv2_receiver_ops =3D {
-+	.send_data =3D mhuv2_recv_send_data,
-+	.startup =3D mhuv2_recv_startup,
-+	.shutdown =3D mhuv2_recv_shutdown,
-+	.last_tx_done =3D mhuv2_recv_last_tx_done,
-+};
-+
-+static const struct mbox_chan_ops mhuv2_sender_ops =3D {
-+	.send_data =3D mhuv2_send_data,
-+	.startup =3D mhuv2_startup,
-+	.shutdown =3D mhuv2_shutdown,
-+	.last_tx_done =3D mhuv2_last_tx_done,
-+};
-+
-+static struct mbox_chan *mhuv2_mbox_of_xlate(struct mbox_controller *ctrl=
,
-+					     const struct of_phandle_args *pa)
-+{
-+	struct mbox_chan *chan;
-+
-+	if (pa->args_count !=3D 1)
-+		return ERR_PTR(-EINVAL);
-+
-+	if (pa->args[0] >=3D ctrl->num_chans)
-+		return ERR_PTR(-ENOENT);
-+
-+	chan =3D &ctrl->chans[pa->args[0]];
-+	return chan;
-+}
-+
-+static int mhuv2_probe(struct amba_device *adev, const struct amba_id *id=
)
-+{
-+	int err;
-+	struct device *dev =3D &adev->dev;
-+	const struct device_node *np =3D dev->of_node;
-+	struct arm_mhuv2 *mhuv2;
-+	const char *mhuv2_protocol_str;
-+
-+	/* Allocate memory for device */
-+	mhuv2 =3D devm_kzalloc(dev, sizeof(*mhuv2), GFP_KERNEL);
-+	if (!mhuv2)
-+		return -ENOMEM;
-+
-+	mhuv2->dev =3D dev;
-+
-+	/* Assign transport protocol-specific operations */
-+	err =3D of_property_read_string(np, "mhu-protocol", &mhuv2_protocol_str)=
;
-+
-+	if (err) {
-+		dev_err(dev,
-+			 "Probe failed: no transport protocol specified\n");
-+		return -ENODEV;
-+	} else if (strcmp(mhuv2_protocol_str,
-+		mhuv2_protocol_dt_identifiers[SINGLE_WORD]) =3D=3D 0) {
-+		mhuv2->ops =3D &mhuv2_single_word_ops;
-+	} else {
-+		dev_err(dev,
-+			"Probe failed: '%s' is not a valid transport protocol specifier\n",
-+			mhuv2_protocol_str);
-+		return -ENODEV;
-+	}
-+
-+	/* Get MHU type specific properties from device tree */
-+	if (adev->irq[0]) {
-+		mhuv2->frame =3D RECEIVER_FRAME;
-+		mhuv2->reg.recv =3D (struct mhu2_recv_frame_reg *)of_iomap(
-+			(struct device_node *)np, 0);
-+		if (!mhuv2->reg.recv)
-+			goto io_fail;
-+		mhuv2->irq =3D adev->irq[0];
-+	} else {
-+		mhuv2->frame =3D SENDER_FRAME;
-+		mhuv2->reg.send =3D (struct mhu2_send_frame_reg *)of_iomap(
-+			(struct device_node *)np, 0);
-+		if (!mhuv2->reg.send)
-+			goto io_fail;
-+	}
-+
-+	/* Mailbox controller setup */
-+	mhuv2->mbox.dev =3D dev;
-+	mhuv2->mbox.txdone_irq =3D false;
-+	mhuv2->mbox.txdone_poll =3D true;
-+	mhuv2->mbox.txpoll_period =3D 1;
-+	mhuv2->mbox.of_xlate =3D mhuv2_mbox_of_xlate;
-+	mhuv2->mbox.ops =3D mhuv2->frame =3D=3D SENDER_FRAME ? &mhuv2_sender_ops=
 :
-+							 &mhuv2_receiver_ops;
-+	/*
-+	 * Transport protocol specific setup
-+	 * Setup function _must_ allocate mailbox channels according to the
-+	 * number of channels provided in the given transport protocol mode.
-+	 */
-+	err =3D mhuv2->ops->setup(mhuv2);
-+	if (err)
-+		return err;
-+
-+	/* Request an interrupt if this is a receiver frame */
-+	if (mhuv2->frame =3D=3D RECEIVER_FRAME) {
-+		err =3D devm_request_threaded_irq(dev, adev->irq[0], NULL,
-+			mhuv2_rx_interrupt, IRQF_ONESHOT, "mhuv2_link", mhuv2);
-+		if (err) {
-+			dev_err(dev, "unable to acquire IRQ %d\n", mhuv2->irq);
-+			return err;
-+		}
-+		/*
-+		 * For minor version 1 and forward, the combined interrupt of
-+		 * the receiver frame must be explicitly enabled during startup.
-+		 */
-+		if (readl_relaxed_bitfield(&mhuv2->reg.recv->AIDR,
-+					   ARCH_MINOR_REV) > 0) {
-+			writel_relaxed_bitfield(1, &mhuv2->reg.recv->INT_EN,
-+						CHCOMB);
-+		}
-+	}
-+
-+	amba_set_drvdata(adev, mhuv2);
-+
-+	err =3D devm_mbox_controller_register(dev, &mhuv2->mbox);
-+	if (err) {
-+		dev_err(dev, "failed to register ARM MHUv2 driver %d\n", err);
-+		iounmap(mhuv2->frame =3D=3D RECEIVER_FRAME ? mhuv2->reg.recv :
-+							 mhuv2->reg.send);
-+		return err;
-+	}
-+
-+	dev_info(dev, "ARM MHUv2 %s frame (%s) Mailbox driver registered\n",
-+		 mhuv2_frame_dt_identifiers[mhuv2->frame],
-+		 mhuv2_protocol_str);
-+
-+	return 0;
-+
-+io_fail:
-+	dev_err(dev, "Probe failed: failed to map '%s' frame\n",
-+		mhuv2_frame_dt_identifiers[mhuv2->frame]);
-+	iounmap(mhuv2->frame =3D=3D RECEIVER_FRAME ? mhuv2->reg.recv :
-+						 mhuv2->reg.send);
-+	return -ENOMEM;
-+}
-+
-+static int mhuv2_remove(struct amba_device *adev)
-+{
-+	return 0;
-+}
-+
-+static struct amba_id mhuv2_ids[] =3D {
-+	{
-+		.id =3D 0x4b0d1,
-+		.mask =3D 0xfffff,
-+	},
-+	{
-+		.id =3D 0xbb0d1,
-+		.mask =3D 0xfffff,
-+	},
-+	{ 0, 0 },
-+};
-+MODULE_DEVICE_TABLE(amba, mhuv2_ids);
-+
-+static struct amba_driver arm_mhuv2_driver =3D {
-+	.drv =3D {
-+		.name	=3D "mhuv2",
-+	},
-+	.id_table	=3D mhuv2_ids,
-+	.probe		=3D mhuv2_probe,
-+	.remove		=3D mhuv2_remove,
-+};
-+module_amba_driver(arm_mhuv2_driver);
-+
-+MODULE_LICENSE("GPL v2");
-+MODULE_DESCRIPTION("ARM MHUv2 Driver");
-+MODULE_AUTHOR("Morten Borup Petersen <morten.petersen@arm.com>");
-diff --git a/include/linux/mailbox/arm-mbox-message.h b/include/linux/mail=
box/arm-mbox-message.h
-new file mode 100644
-index 000000000000..112b4f927c1a
---- /dev/null
-+++ b/include/linux/mailbox/arm-mbox-message.h
-@@ -0,0 +1,37 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Arm Mailbox Message
-+ *
-+ * The Arm mailbox message structure is used to pass data- and length
-+ * information between a mailbox client and mailbox controller, through t=
he
-+ * provided void* of the common mailbox frameworks send- and receive APIs=
.
-+ *
-+ * This will be utilized when a mailbox controller is able to transmit
-+ * more than a single word within a transmission, allowing the controller
-+ * to fully utilize its available resources.
-+ * No message protocol is enforced through this structure - a utilizing m=
ailbox
-+ * client driver shall implement its own message protocol, which may then=
 be
-+ * transmitted through an arm_mbox_msg.
-+ *
-+ * Given a message protocol of size A and an arm_mbox_msg containing data=
 of
-+ * length B, a mailbox channel may callback with B < A. In this case, the
-+ * message protocol driver must implement a state machine which allows fo=
r
-+ * multiple callbacks that provides parts of a full message of size A. Th=
is
-+ * state machine must account for, that the length of the arm_mbox_msg re=
ceived
-+ * may vary between callbacks based on the underlying hardware as well as=
 the
-+ * transmitted data.
-+ *
-+ * Copyright (C) 2019 Arm Ltd.
-+ */
-+
-+#ifndef _LINUX_ARM_MBOX_MESSAGE_H_
-+#define _LINUX_ARM_MBOX_MESSAGE_H_
-+
-+#include <linux/types.h>
-+
-+struct arm_mbox_msg {
-+	void *data;
-+	size_t len;
-+};
-+
-+#endif /* _LINUX_ARM_MBOX_MESSAGE_H_ */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0005=
-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0005-mailbox-arm_mhuv2-add-doo=
rbell-transport-protocol-op.patch
deleted file mode 100644
index a548d49..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0005-mailbo=
x-arm_mhuv2-add-doorbell-transport-protocol-op.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 515a936531a25a0c48a97efe3828962ed8d781dd Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Wed, 19 Jun 2019 16:55:20 +0100
-Subject: [PATCH 5/9] mailbox: arm_mhuv2: add doorbell transport protocol
- operations
-
-In doorbell mode, the mailbox controller will provide a mailbox for each
-flag bit available in the combined number of channel windows available
-within the MHU device.
-
-When in doorbell mode, the MHU should be used solely as an interrupt
-generating mechanism. If data is to be transmitted, this must be done
-out-band, ie. through shared memory, by a driving utilizing the mailbox
-for interrupt generation.
-
-Change-Id: I8410b21471743c0b624c873388f9629ea0863789
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Cc:Jassi Brar <jassisinghbrar@gmail.com
-Cc: devicetree@vger.kernel.org
-
-Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
----
- drivers/mailbox/arm_mhu_v2.c | 108 +++++++++++++++++++++++++++++++++++
- 1 file changed, 108 insertions(+)
-
-diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
-index d809076eb47b..efde7a71a3f7 100644
---- a/drivers/mailbox/arm_mhu_v2.c
-+++ b/drivers/mailbox/arm_mhu_v2.c
-@@ -429,6 +429,111 @@ static const struct mhuv2_ops mhuv2_single_word_ops =
=3D {
- };
- /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
-=20
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Doorbell tra=
nsport protocol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
-+
-+static inline int mhuv2_read_data_doorbell(struct arm_mhuv2 *mhuv2,
-+					   struct mbox_chan *chan,
-+					   struct arm_mbox_msg *msg)
-+{
-+	return 0;
-+}
-+
-+static inline int mhuv2_clear_data_doorbell(struct arm_mhuv2 *mhuv2,
-+					    struct mbox_chan *chan,
-+					    struct arm_mbox_msg *msg)
-+{
-+	const u32 ch_mbox_idx =3D mhuv2_chan_idx(chan);
-+	const u32 ch_window_idx =3D ch_mbox_idx / MHUV2_STAT_BITS;
-+	const u32 ch_window_reg_idx =3D ch_mbox_idx % MHUV2_STAT_BITS;
-+
-+	writel_relaxed(BIT(ch_window_reg_idx),
-+		       &mhuv2->reg.recv->channel[ch_window_idx].STAT_CLEAR);
-+	return 0;
-+}
-+
-+static inline int mhuv2_send_data_doorbell(struct arm_mhuv2 *mhuv2,
-+					   struct mbox_chan *chan,
-+					   const struct arm_mbox_msg *msg)
-+{
-+	const u32 ch_mbox_idx =3D mhuv2_chan_idx(chan);
-+	const u32 ch_window_idx =3D ch_mbox_idx / MHUV2_STAT_BITS;
-+	const u32 ch_window_reg_idx =3D ch_mbox_idx % MHUV2_STAT_BITS;
-+
-+	writel_relaxed(
-+		readl_relaxed(&mhuv2->reg.send->channel[ch_window_idx].STAT) |
-+			BIT(ch_window_reg_idx),
-+		&mhuv2->reg.send->channel[ch_window_idx].STAT_SET);
-+	return 0;
-+}
-+
-+static inline int mhuv2_last_tx_done_doorbell(struct arm_mhuv2 *mhuv2,
-+					      struct mbox_chan *chan)
-+{
-+	const u32 ch_mbox_idx =3D mhuv2_chan_idx(chan);
-+	const u32 ch_window_idx =3D ch_mbox_idx / MHUV2_STAT_BITS;
-+	const u32 ch_window_reg_idx =3D ch_mbox_idx % MHUV2_STAT_BITS;
-+
-+	return (readl_relaxed(&mhuv2->reg.send->channel[ch_window_idx].STAT) &
-+		BIT(ch_window_reg_idx)) =3D=3D 0;
-+}
-+
-+static inline int mhuv2_setup_doorbell(struct arm_mhuv2 *mhuv2)
-+{
-+	int i;
-+	const u32 channel_windows =3D
-+		readl_relaxed_bitfield(mhuv2->frame =3D=3D RECEIVER_FRAME ?
-+					       &mhuv2->reg.recv->MHU_CFG :
-+					       &mhuv2->reg.send->MHU_CFG,
-+				       NUM_CH);
-+
-+	mhuv2->mbox.num_chans =3D MHUV2_STAT_BITS * channel_windows;
-+	mhuv2->mbox.chans =3D
-+		devm_kzalloc(mhuv2->dev,
-+			     mhuv2->mbox.num_chans * sizeof(struct mbox_chan),
-+			     GFP_KERNEL);
-+
-+	for (i =3D 0; i < mhuv2->mbox.num_chans; i++) {
-+		mhuv2->mbox.chans[i].con_priv =3D
-+			devm_kzalloc(mhuv2->dev,
-+				     sizeof(struct arm_mhuv2_mbox_chan_priv),
-+				     GFP_KERNEL);
-+		mhuv2_chan_idx(&mhuv2->mbox.chans[i]) =3D i;
-+	}
-+
-+	if (mhuv2->frame =3D=3D RECEIVER_FRAME) {
-+		/* Ensure all status registers are unmasked */
-+		for (i =3D 0; i < channel_windows; i++) {
-+			writel_relaxed(0x0,
-+				       &mhuv2->reg.recv->channel[i].MASK_SET);
-+		}
-+	}
-+
-+	return 0;
-+}
-+
-+static inline struct mbox_chan *
-+	mhuv2_get_active_mbox_chan_doorbell(struct arm_mhuv2 *mhuv2)
-+{
-+	const u32 ch_window_idx =3D mhuv2_get_non_zero_ch_idx(mhuv2);
-+	const u32 ch_window_reg_idx =3D __find_set_bit(
-+		readl_relaxed(&mhuv2->reg.recv->channel[ch_window_idx].STAT));
-+	if (ch_window_reg_idx =3D=3D -1)
-+		return ERR_PTR(-EIO);
-+
-+	return &mhuv2->mbox.chans[ch_window_reg_idx +
-+				  ch_window_idx * MHUV2_STAT_BITS];
-+}
-+
-+static const struct mhuv2_ops mhuv2_doorbell_ops =3D {
-+	.read_data =3D mhuv2_read_data_doorbell,
-+	.clear_data =3D mhuv2_clear_data_doorbell,
-+	.send_data =3D mhuv2_send_data_doorbell,
-+	.setup =3D mhuv2_setup_doorbell,
-+	.last_tx_done =3D mhuv2_last_tx_done_doorbell,
-+	.get_active_mbox_chan =3D mhuv2_get_active_mbox_chan_doorbell,
-+};
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
-+
- /*
-  * MHUv2 receiver interrupt service routine
-  *
-@@ -591,6 +696,9 @@ static int mhuv2_probe(struct amba_device *adev, const=
 struct amba_id *id)
- 	} else if (strcmp(mhuv2_protocol_str,
- 		mhuv2_protocol_dt_identifiers[SINGLE_WORD]) =3D=3D 0) {
- 		mhuv2->ops =3D &mhuv2_single_word_ops;
-+	} else if (strcmp(mhuv2_protocol_str,
-+		mhuv2_protocol_dt_identifiers[DOORBELL]) =3D=3D 0) {
-+		mhuv2->ops =3D &mhuv2_doorbell_ops;
- 	} else {
- 		dev_err(dev,
- 			"Probe failed: '%s' is not a valid transport protocol specifier\n",
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0006=
-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0006-mailbox-arm_mhuv2-add-mul=
ti-word-transport-protocol-.patch
deleted file mode 100644
index 9fd327f..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0006-mailbo=
x-arm_mhuv2-add-multi-word-transport-protocol-.patch
+++ /dev/null
@@ -1,271 +0,0 @@
-From 31140984e2ead5d56b072d0fed0b5f18a1e7e825 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Wed, 19 Jun 2019 17:00:31 +0100
-Subject: [PATCH 6/9] mailbox: arm_mhuv2: add multi word transport protocol
- operations
-
-When in multi-word mode, the mailbox controller will provide a single
-mailbox. It is required that the MHU device has at least 2 channel windows
-available for the MHU to function in multi-word mode.
-
-Transmitting and receiving data through the mailbox framework in
-multi-word mode is done through a struct arm_mbox_msg.
-
-Change-Id: Ibcf352d19ae3908093b20350853b16cf6a7933a2
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Cc: jassisinghbrar@gmail.com
-Cc: devicetree@vger.kernel.org
-
-Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
----
- drivers/mailbox/arm_mhu_v2.c | 225 +++++++++++++++++++++++++++++++++++
- 1 file changed, 225 insertions(+)
-
-diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
-index efde7a71a3f7..e73e829d4f1e 100644
---- a/drivers/mailbox/arm_mhu_v2.c
-+++ b/drivers/mailbox/arm_mhu_v2.c
-@@ -429,6 +429,228 @@ static const struct mhuv2_ops mhuv2_single_word_ops =
=3D {
- };
- /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
-=20
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Multi word transport =
protocol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
-+static inline int mhuv2_read_data_multi_word(struct arm_mhuv2 *mhuv2,
-+					     struct mbox_chan *chan,
-+					     struct arm_mbox_msg *msg)
-+{
-+	int ch;
-+	const int channels =3D
-+		readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
-+
-+	msg->data =3D kzalloc(MHUV2_STAT_BYTES * channels, GFP_KERNEL);
-+
-+	for (ch =3D 0; ch < channels; ch++) {
-+		/*
-+		 * Messages are expected to be received in order of most
-+		 * significant word to least significant word.
-+		 * (see mhuv2_send_data_multi_word)
-+		 */
-+		const mhuv2_stat_reg_t word =3D
-+			readl_relaxed(&mhuv2->reg.recv->channel[ch].STAT);
-+		((mhuv2_stat_reg_t *)msg->data)[channels - 1 - ch] =3D word;
-+	}
-+
-+	msg->len =3D channels * MHUV2_STAT_BYTES;
-+	return 0;
-+}
-+
-+static inline int mhuv2_clear_data_multi_word(struct arm_mhuv2 *mhuv2,
-+					      struct mbox_chan *chan,
-+					      struct arm_mbox_msg *msg)
-+{
-+	int ch;
-+	const int channels =3D
-+		readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
-+
-+	for (ch =3D 0; ch < channels; ch++) {
-+		/*
-+		 * Last channel window must be cleared as the final operation.
-+		 * Upon clearing the last channel window register, which is
-+		 * unmasked in multi-word mode, the interrupt is deasserted.
-+		 */
-+		writel_relaxed(
-+			readl_relaxed(&mhuv2->reg.recv->channel[ch].STAT),
-+			&mhuv2->reg.recv->channel[ch].STAT_CLEAR);
-+	}
-+	return 0;
-+}
-+
-+static inline int __mhuv2_mw_bytes_to_send(const int bytes_in_round,
-+					    const int bytes_left)
-+{
-+	/*
-+	 * Bytes to send on the current channel will always be MHUV2_STAT_BYTES
-+	 * unless in the last round and
-+	 *	msg->len % MHUV2_STAT_BYTES !=3D 0
-+	 */
-+	if (bytes_in_round % MHUV2_STAT_BYTES !=3D 0) {
-+		const int bts =3D bytes_left % MHUV2_STAT_BYTES;
-+		return bts =3D=3D 0 ? MHUV2_STAT_BYTES : bts;
-+	} else {
-+		return MHUV2_STAT_BYTES;
-+	}
-+}
-+
-+static inline int mhuv2_send_data_multi_word(struct arm_mhuv2 *mhuv2,
-+					     struct mbox_chan *chan,
-+					     const struct arm_mbox_msg *msg)
-+{
-+	/*
-+	 * Message will be transmitted from most significant to least
-+	 * significant word. This is to allow for messages shorter than
-+	 * $channels to still trigger the receiver interrupt which gets
-+	 * activated when the last STAT register is written. As an example, a
-+	 * 6-word message is to be written on a 4-channel MHU connection:
-+	 * Registers marked with '*' are masked, and will not generate an
-+	 * interrupt on the receiver side once written.
-+	 *
-+	 * uint32_t *data =3D [0x00000001],[0x00000002],[0x00000003],[0x00000004=
],
-+	 *		    [0x00000005], [0x00000006]
-+	 *
-+	 *  ROUND 1:
-+	 *   STAT reg      To write    Write sequence
-+	 *  [ STAT 3 ] <- [0x00000001]       4 <- triggers interrupt on receiver
-+	 * *[ STAT 2 ] <- [0x00000002]       3
-+	 * *[ STAT 1 ] <- [0x00000003]       2
-+	 * *[ STAT 0 ] <- [0x00000004]       1
-+	 *
-+	 *  data +=3D 4 // Increment data pointer by number of STAT regs
-+	 *
-+	 *  ROUND 2:
-+	 *   STAT reg      To write    Write sequence
-+	 *  [ STAT 3 ] <- [0x00000005]       2 <- triggers interrupt on receiver
-+	 * *[ STAT 2 ] <- [0x00000006]       1
-+	 * *[ STAT 1 ] <- [0x00000000]
-+	 * *[ STAT 0 ] <- [0x00000000]
-+	 */
-+	int bytes_left, bytes_to_send, i, ch_idx;
-+	const int ch_windows =3D
-+		readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
-+	const size_t round_capacity =3D ch_windows * MHUV2_STAT_BYTES;
-+
-+	bytes_left =3D msg->len;
-+	mhuv2_stat_reg_t *data =3D msg->data;
-+
-+	while (bytes_left > 0) {
-+		/* Note: Each entry of this loop indicates a new ROUND */
-+		if (*(u32 *)data =3D=3D 0) {
-+			dev_err(mhuv2->dev,
-+				"values in *data aligned on NUM_STAT boundaries must not be zero to e=
nsure that receiver interrupt is triggered\n",
-+				ch_windows);
-+			return -EINVAL;
-+		}
-+
-+		const int bytes_in_round =3D bytes_left > round_capacity ?
-+						   round_capacity :
-+						   bytes_left;
-+
-+		for (i =3D (ch_windows - 1); i >=3D 0; i--) {
-+			ch_idx =3D ch_windows - 1 - i;
-+			/*
-+			 * Check whether data should be transmitted in register
-+			 * of index 'ch'.
-+			 */
-+			if (bytes_in_round > (i * MHUV2_STAT_BYTES)) {
-+				mhuv2_stat_reg_t word =3D data[i];
-+
-+				bytes_to_send =3D __mhuv2_mw_bytes_to_send(
-+					bytes_in_round, bytes_left);
-+
-+				if (bytes_to_send !=3D MHUV2_STAT_BYTES) {
-+					word &=3D LSB_MASK(bytes_to_send *
-+							 __CHAR_BIT__);
-+				}
-+				while (readl_relaxed(
-+					       &mhuv2->reg.send->channel[ch_idx]
-+							.STAT) !=3D 0)
-+					continue;
-+
-+				writel_relaxed(
-+				    word,
-+				    &mhuv2->reg.send->channel[ch_idx].STAT_SET);
-+				bytes_left -=3D bytes_to_send;
-+			}
-+		}
-+
-+		data +=3D ch_windows;
-+
-+		for (ch_idx =3D 0; ch_idx < ch_windows; ch_idx++) {
-+			while (readl_relaxed(
-+				   &mhuv2->reg.send->channel[ch_idx].STAT) !=3D 0)
-+				continue;
-+		}
-+	}
-+	return 0;
-+}
-+
-+
-+static inline int mhuv2_last_tx_done_multi_word(struct arm_mhuv2 *mhuv2,
-+						struct mbox_chan *chan)
-+{
-+	int ch_idx;
-+	bool tx_done =3D true;
-+
-+	for (ch_idx =3D 0;
-+	     ch_idx < readl_relaxed_bitfield(&mhuv2->reg.send->MHU_CFG, NUM_CH);
-+	     ch_idx++) {
-+		tx_done &=3D readl_relaxed(
-+				   &mhuv2->reg.send->channel[ch_idx].STAT) =3D=3D 0;
-+	}
-+	return tx_done;
-+}
-+
-+static inline int mhuv2_setup_multi_word(struct arm_mhuv2 *mhuv2)
-+{
-+	int ret, i;
-+
-+	const u32 channel_windows =3D
-+		readl_relaxed_bitfield(mhuv2->frame =3D=3D RECEIVER_FRAME ?
-+					       &mhuv2->reg.recv->MHU_CFG :
-+					       &mhuv2->reg.send->MHU_CFG,
-+				       NUM_CH);
-+	if (channel_windows < 2) {
-+		dev_err(mhuv2->dev,
-+			"Error: at least 2 MHU channel windows are required for using the mult=
i-word transfer protocol");
-+		return -ENODEV;
-+	}
-+
-+	if (mhuv2->frame =3D=3D RECEIVER_FRAME) {
-+		/*
-+		 * The multi-word transport protocol mandates that all but
-+		 * the last status register must be masked.
-+		 */
-+		for (i =3D 0; i < (channel_windows - 1); i++) {
-+			writel_relaxed(-1,
-+				       &mhuv2->reg.recv->channel[i].MASK_SET);
-+		}
-+	}
-+
-+	mhuv2->mbox.num_chans =3D 1;
-+	mhuv2->mbox.chans =3D
-+		devm_kzalloc(mhuv2->dev,
-+			     mhuv2->mbox.num_chans * sizeof(struct mbox_chan),
-+			     GFP_KERNEL);
-+
-+	return 0;
-+}
-+
-+static inline struct mbox_chan *
-+	mhuv2_get_active_mbox_chan_multi_word(struct arm_mhuv2 *mhuv2)
-+{
-+	return &mhuv2->mbox.chans[0];
-+}
-+
-+static const struct mhuv2_ops mhuv2_multi_word_ops =3D {
-+	.read_data =3D mhuv2_read_data_multi_word,
-+	.clear_data =3D mhuv2_clear_data_multi_word,
-+	.send_data =3D mhuv2_send_data_multi_word,
-+	.setup =3D mhuv2_setup_multi_word,
-+	.last_tx_done =3D mhuv2_last_tx_done_multi_word,
-+	.get_active_mbox_chan =3D mhuv2_get_active_mbox_chan_multi_word,
-+};
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
-+
- /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Doorbell tra=
nsport protocol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
-=20
- static inline int mhuv2_read_data_doorbell(struct arm_mhuv2 *mhuv2,
-@@ -696,6 +918,9 @@ static int mhuv2_probe(struct amba_device *adev, const=
 struct amba_id *id)
- 	} else if (strcmp(mhuv2_protocol_str,
- 		mhuv2_protocol_dt_identifiers[SINGLE_WORD]) =3D=3D 0) {
- 		mhuv2->ops =3D &mhuv2_single_word_ops;
-+	} else if (strcmp(mhuv2_protocol_str,
-+		mhuv2_protocol_dt_identifiers[MULTI_WORD]) =3D=3D 0) {
-+		mhuv2->ops =3D &mhuv2_multi_word_ops;
- 	} else if (strcmp(mhuv2_protocol_str,
- 		mhuv2_protocol_dt_identifiers[DOORBELL]) =3D=3D 0) {
- 		mhuv2->ops =3D &mhuv2_doorbell_ops;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0007=
-firmware-arm_scmi-Add-fast_switch_possible-api.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.4/tc0/0007-firmware-arm_scmi-Add-fast_swit=
ch_possible-api.patch
deleted file mode 100644
index 9369d78..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0007-firmwa=
re-arm_scmi-Add-fast_switch_possible-api.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 68ce2dfe4c6f3806001fb8d682d6e99a9580dc2a Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Wed, 24 Jun 2020 11:16:01 +0100
-Subject: [PATCH 7/9] firmware: arm_scmi: Add fast_switch_possible() api
-
-Add a new fast_switch_possible interface to the existing
-perf_ops api to export the information of whether or not
-fast_switch is possible in this driver.
-
-This can be used by the CPUFreq driver and framework to
-choose proper mechanism for frequency change.
-
-Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
-Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/commit/drivers/firmware/arm_scmi?id=3D1909872ff20fc378e=
c6a44ea1a2b2966d834e504]
----
- drivers/firmware/arm_scmi/perf.c | 12 ++++++++++++
- include/linux/scmi_protocol.h    |  2 ++
- 2 files changed, 14 insertions(+)
-
-diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/=
perf.c
-index 601af4edad5e..c9350bb2ba1f 100644
---- a/drivers/firmware/arm_scmi/perf.c
-+++ b/drivers/firmware/arm_scmi/perf.c
-@@ -691,6 +691,17 @@ static int scmi_dvfs_est_power_get(const struct scmi_=
handle *handle, u32 domain,
- 	return ret;
- }
-=20
-+static bool scmi_fast_switch_possible(const struct scmi_handle *handle,
-+				   struct device *dev)
-+{
-+	struct perf_dom_info *dom;
-+	struct scmi_perf_info *pi =3D handle->perf_priv;
-+
-+	dom =3D pi->dom_info + scmi_dev_domain_id(dev);
-+
-+	return (dom->fc_info && dom->fc_info->level_set_addr);
-+}
-+
- static struct scmi_perf_ops perf_ops =3D {
- 	.limits_set =3D scmi_perf_limits_set,
- 	.limits_get =3D scmi_perf_limits_get,
-@@ -702,6 +713,7 @@ static struct scmi_perf_ops perf_ops =3D {
- 	.freq_set =3D scmi_dvfs_freq_set,
- 	.freq_get =3D scmi_dvfs_freq_get,
- 	.est_power_get =3D scmi_dvfs_est_power_get,
-+	.fast_switch_possible =3D scmi_fast_switch_possible,
- };
-=20
- static int scmi_perf_protocol_init(struct scmi_handle *handle)
-diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
-index 881fea47c83d..b1f4a88219c5 100644
---- a/include/linux/scmi_protocol.h
-+++ b/include/linux/scmi_protocol.h
-@@ -114,6 +114,8 @@ struct scmi_perf_ops {
- 			unsigned long *rate, bool poll);
- 	int (*est_power_get)(const struct scmi_handle *handle, u32 domain,
- 			     unsigned long *rate, unsigned long *power);
-+	bool (*fast_switch_possible)(const struct scmi_handle *handle,
-+			struct device *dev);
- };
-=20
- /**
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0008=
-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0008-cpufreq-arm_scmi-Set-fast=
_switch_possible-conditiona.patch
deleted file mode 100644
index e392242..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0008-cpufre=
q-arm_scmi-Set-fast_switch_possible-conditiona.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 47300d8385801913709eda5fd237d54f51477546 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Wed, 24 Jun 2020 11:25:02 +0100
-Subject: [PATCH 8/9] cpufreq: arm_scmi: Set fast_switch_possible condition=
ally
-
-Currently the fast_switch_possible flag is set unconditionally
-to true. Based on this, schedutil does not create a
-thread for frequency switching and would always use the
-fast switch path.
-However, if the platform does not support frequency
-fast switch, this may cause the governor to attempt an
-operation that is not supported by the platform.
-
-Fix this by correctly retrieve the fast_switch capability
-from the driver which knows if the platform can support
-this feature.
-
-Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
-Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/commit/drivers/cpufreq?id=3Dfb3571276b970cbe7b45ecdc762=
e92f3f305ad6d]
----
- drivers/cpufreq/scmi-cpufreq.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq=
.c
-index e6182c89df79..931fcf0ef221 100644
---- a/drivers/cpufreq/scmi-cpufreq.c
-+++ b/drivers/cpufreq/scmi-cpufreq.c
-@@ -198,7 +198,8 @@ static int scmi_cpufreq_init(struct cpufreq_policy *po=
licy)
-=20
- 	policy->cpuinfo.transition_latency =3D latency;
-=20
--	policy->fast_switch_possible =3D true;
-+	policy->fast_switch_possible =3D
-+		handle->perf_ops->fast_switch_possible(handle, cpu_dev);
-=20
- 	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0009=
-driver-firmware-Initial-version-of-ffa-driver-based-.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0009-driver-firmware-Initial-v=
ersion-of-ffa-driver-based-.patch
deleted file mode 100644
index e5e1ff6..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0009-driver=
-firmware-Initial-version-of-ffa-driver-based-.patch
+++ /dev/null
@@ -1,1461 +0,0 @@
-Upstream-Status: Pending [https://git.kernel.org/pub/scm/linux/kernel/git/=
sudeep.holla/linux.git/commit/?h=3Dffa_rel_proto&id=3D74aeede25bd737f4930e1=
322f5780ec1c61b9fd5]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 411f4ed69a06f213fb2abb7dbef0be5ce31ff55e Mon Sep 17 00:00:00 2001
-From: Jose Marinho <jose.marinho@arm.com>
-Date: Tue, 29 Oct 2019 09:28:55 +0000
-Subject: [PATCH] driver: firmware: Initial version of ffa driver based on
- ffa_rel_proto
-
-Initial version of ffa driver based on ffa_rel_proto [1].
-
-[1]: https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.gi=
t/log/?h=3Dffa_rel_proto
-
-Squashed in:
-	 firmware: arm64/spci: Add initial SPCI driver
-
-	 Add initial SPCI driver
-
-	 firmware: spci: add conduit selection from DT
-
-	 The driver can use smc or hvc conduits depending on what is
-	 specified in the spci node in the DT.
-
-	 arm64: spci/smccc: Create smc call returning on x0 to x7
-
-	 The new smc call is SMCCCv1.2 compliant.
-
-	 arm_spci: Register Rx/Tx buffers.
-
-	 Registers the Rx/Tx buffers with the SPCI implementation at a higher EL.
-	 The buffers are restricted to 4KB in this implementation.
-
-	 arm_spci: Add SPCI memory sharing mechanisms.
-
-	 Add mem_share and mem_reclaim to the SPCI driver interface.
-	 These two methods allow for the basic memory sharing use-case where
-	 normal world shares a set of pages with secure world.
-	 The memory region description is in this implementation restricted to
-	 4KB (i.e. it must fit in the Tx buffer of the normal world VM).
-
-	 spci_driver/mem_share: Add lock around TX Buffer
-
-	 Ensure we aquire a lock around the TX buffer when sending information to
-	 prevent race conditions.
-
-	 arm_spci: Expose SPCI_PARTITION_INFO_GET
-
-	 Expose the SPCI_PARTITION_INFO_GET ABI to allow querying the system for
-	 information about a set of partitions identified by a specified UUID.
-
-	 The function expects the 128bit UUID to be discovered passed via 4 32bit
-	 words in the format: UUID_0-UUID_1-UUID_2-UUID3 and a pointer to an
-	 array of `spci_partition_info` structs that will allocated and populated
-	 with the discovered partitions information by the SPCI driver.  The
-	 caller is responsible for freeing this memory allocated by the SPCI
-	 driver.
-
-	 The function returns the number of the partitions found (and therefore
-	 the number of elements in the array) or a negative value indicating the
-	 error code if unsuccessful.
-
-	 This implementation currently disallows use of the NULL UUID.
-
-	 arm_spci: Implement rx_release
-
-	 SPCI: Move driver to directory
-
-	 The SPCI driver has a specific directory at drivers/firmware/spci.
-
-	 SPCI: multi-fragment memory share support
-
-	 arm_spci: use scatterlist in mem_share interface
-
-	 Previously an array of page* was passed in the mem_share interface.
-	 This commit introduces a scatterlist as partameter to mem_share function=
.
-
-	 arm_spci: Add RX_RELEASE return to spci_rx_release
-
-	 A Hypervisor can return SPCI_RX_RELEASE when the PVM calls
-	 SPCI_RX_RELEASE to signal that other VMs need to be scheduled.
-
-	 arm_spci: Change spci_memory_reclaim declaration
-
-	 Function takes an enum mem_clear_t flag to denote if memory should be
-	 cleared upon reclaim.
-
-	 arm_spci: Allow nil UUID in spci_parition_info_get
-
-	 Previously the nil UUID was disallowed.
-
-	 arm_spci: Add support for non-Tx buffer mem_share
-
-	 This commit introduces the buffer*, buffer_size parameters to the
-	 mem_share function. The buffer can be used alternatively to the Tx
-	 buffer. The mem_share function will populate the IPA-contiguous memory
-	 pointed to by buffer using the information in sg.
-
-	 The buffer* must be NULL is mem_share should use the Tx buffer.
-	 The buffer*, if non-NULL, must point to a IPA-contiguous memory region
-	 of size multiple of 4kiB.
-
-	 arm_spci: Support pause/resume in mem_share handle
-
-	 The Hypervisor is allowed to return SPCI_MEM_OPS_PAUSE if a mem_share
-	 operation is taking too long. The PVM must reply with
-	 SPCI_MEM_OPS_RESUME.
-
-	 arm_spci: Ammend debug print.
-
-	 arm_spci: add missing fields in mem descriptor
-
-	 The sender_id, vm_id fields were not properly filled in the mem_share
-	 function.
-
-	 arm_spci: mem_share selection of Tx or alloc buf
-
-	 This commit allows the mem_share invokation to select the  tx buffer or =
a
-	 dynamically allocated buffer to be used for the transfer of the memory
-	 region description.
-
-	 if use_tx =3D=3D true: the tx_lock is held until the memory region is fu=
lly
-	 transmitted.
-
-	 if use_tx =3D=3D false: the tx_lock is very briefly held in the preamble
-	 and postamble of the mem_share procedure.
-
-	 arm_spci: Allow compilation for arm arch [smcccv1_2 bits]
-
-	 arm_spci: Allow compilation for arm arch [arm_spci bits]
-
-	 Implement  SPCI features
-
-	 Currently only SPCI_Direct_Req is checked during SPCI driver
-	 initialisation.
-
-	 arm_spci: add err print when features does not report direct_req support
-
-	 arm_spci: refactor mem_share implementation for EAC [arm_spci bits]
-
-	 arm_spci: introduce support for SPCI_INTERRUPT
-
-	 A SP while executing in the context of a SPCI_MSG_SEND_DIRECT_REQ
-	 may be interrupted. In which case the scheduler must be instructed and
-	 be provided with the necessary information to resume the interrupted SP.
-
-	 arm_ffa: optee: Swap spci/SPCI for ffa/FFA. [arm_ffa bits]
-
-	 arm_ffa: Implement ffa_version discovery.
-
-	 arm_ffa: corrections to EAC support.
-
-	 arm_ffa: cast status return to signed for compare
-
-	 arm_ffa: rename 1st member of arm_smcccv1_2_return [arm-smcccv1_2.h bits=
]
-
-	 The smcccv1_2_return.func is renamed to arg0.
-
-	 arm_ffa: rename 1st member of arm_smcccv1_2_return [arm_ffa bits]
-
-	 The smcccv1_2_return.func is renamed to arg0.
-
-	 arm_ffa: set the default shareability to inner.
-
-	 Pages are shared with inner shareability attribute set in S2.
-
-	 arm_ffa: remove some panic calls
-
-	 Some panics were swaped by pr_warns and an error code return when the
-	 error condition being signaled is predicted by the FFA spec. The panics
-	 issued when an unexpected status is returned from EL2 or
-	 EL3 (behaviour deviating from the FFA spec) are left in the driver.
-
-	 arm_ffa: fix warnings and remove debug print
-
-	 Fixed few warnings related to unused variable and in pr_warn prints
-
-	 arm_ffa: correct checkpatch warnings
-
-	 arm_ffa.h: Split memory access permissions
-
-	 Split the FF-A instruction and data access permissions.
-	 This allows for specifying one attribute but not the other. This is
-	 required for lenders of memory for which must not specify the
-	 instruction access permission.
-
-Signed-off-by: Jose Marinho <jose.marinho@arm.com>
-Signed-off-by: Marc Bonnici <marc.bonnici@arm.com>
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I7bd8cf453e99498ab4df1f01092137a67116d15d
----
- arch/arm/kernel/Makefile            |   1 +
- arch/arm/kernel/smcccv1_2-call.S    |  58 +++
- arch/arm64/kernel/Makefile          |   2 +-
- arch/arm64/kernel/smccc_v1_2-call.S |  24 +
- drivers/firmware/Kconfig            |  11 +
- drivers/firmware/Makefile           |   1 +
- drivers/firmware/ffa/Makefile       |   6 +
- drivers/firmware/ffa/arm_ffa.c      | 782 ++++++++++++++++++++++++++++
- include/linux/arm-smcccv1_2.h       |  51 ++
- include/linux/arm_ffa.h             | 235 +++++++++
- 10 files changed, 1170 insertions(+), 1 deletion(-)
- create mode 100644 arch/arm/kernel/smcccv1_2-call.S
- create mode 100644 arch/arm64/kernel/smccc_v1_2-call.S
- create mode 100644 drivers/firmware/ffa/Makefile
- create mode 100644 drivers/firmware/ffa/arm_ffa.c
- create mode 100644 include/linux/arm-smcccv1_2.h
- create mode 100644 include/linux/arm_ffa.h
-
-diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
-index 8cad59465af3..5be97585d130 100644
---- a/arch/arm/kernel/Makefile
-+++ b/arch/arm/kernel/Makefile
-@@ -101,5 +101,6 @@ obj-$(CONFIG_SMP)		+=3D psci_smp.o
- endif
-=20
- obj-$(CONFIG_HAVE_ARM_SMCCC)	+=3D smccc-call.o
-+obj-$(CONFIG_HAVE_ARM_SMCCC)	+=3D smcccv1_2-call.o
-=20
- extra-y :=3D $(head-y) vmlinux.lds
-diff --git a/arch/arm/kernel/smcccv1_2-call.S b/arch/arm/kernel/smcccv1_2-=
call.S
-new file mode 100644
-index 000000000000..9a577c4045a7
---- /dev/null
-+++ b/arch/arm/kernel/smcccv1_2-call.S
-@@ -0,0 +1,58 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Copyright (c) 2020, Linaro Limited
-+ */
-+#include <linux/linkage.h>
-+
-+#include <asm-generic/export.h>
-+#include <asm/opcodes-sec.h>
-+#include <asm/opcodes-virt.h>
-+#include <asm/unwind.h>
-+
-+	/*
-+	 * Wrap c macros in asm macros to delay expansion until after the
-+	 * SMCCC asm macro is expanded.
-+	 */
-+	.macro SMCCC_SMC
-+	__SMC(0)
-+	.endm
-+
-+	.macro SMCCC_HVC
-+	__HVC(0)
-+	.endm
-+
-+	.macro SMCCC instr
-+UNWIND(	.fnstart)
-+	mov	r12, sp
-+	push	{r4-r7}
-+UNWIND(	.save	{r4-r7})
-+	ldm	r12, {r4-r7}
-+	\instr
-+	ldr	r12, [sp, #(4 * 8)]
-+	stm	r12, {r0-r7}
-+	pop	{r4-r7}
-+	bx	lr
-+UNWIND(	.fnend)
-+	.endm
-+
-+/*
-+ * void smccc_smc(unsigned long a0, unsigned long a1, unsigned long a2,
-+ *		  unsigned long a3, unsigned long a4, unsigned long a5,
-+ *		  unsigned long a6, unsigned long a7, struct arm_smccc_res *res,
-+ *		  struct arm_smccc_quirk *quirk)
-+ */
-+ENTRY(__arm_smcccv1_2_smc)
-+	SMCCC SMCCC_SMC
-+ENDPROC(__arm_smcccv1_2_smc)
-+EXPORT_SYMBOL(__arm_smcccv1_2_smc)
-+
-+/*
-+ * void smccc_hvc(unsigned long a0, unsigned long a1, unsigned long a2,
-+ *		  unsigned long a3, unsigned long a4, unsigned long a5,
-+ *		  unsigned long a6, unsigned long a7, struct arm_smccc_res *res,
-+ *		  struct arm_smccc_quirk *quirk)
-+ */
-+ENTRY(__arm_smcccv1_2_hvc)
-+	SMCCC SMCCC_HVC
-+ENDPROC(__arm_smcccv1_2_hvc)
-+EXPORT_SYMBOL(__arm_smcccv1_2_hvc)
-diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
-index b3995329d9e5..4327ef6f4f8d 100644
---- a/arch/arm64/kernel/Makefile
-+++ b/arch/arm64/kernel/Makefile
-@@ -19,7 +19,7 @@ obj-y			:=3D debug-monitors.o entry.o irq.o fpsimd.o		\
- 			   return_address.o cpuinfo.o cpu_errata.o		\
- 			   cpufeature.o alternative.o cacheinfo.o		\
- 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
--			   syscall.o
-+			   syscall.o smccc_v1_2-call.o
-=20
- extra-$(CONFIG_EFI)			:=3D efi-entry.o
-=20
-diff --git a/arch/arm64/kernel/smccc_v1_2-call.S b/arch/arm64/kernel/smccc=
_v1_2-call.S
-new file mode 100644
-index 000000000000..518e849409ed
---- /dev/null
-+++ b/arch/arm64/kernel/smccc_v1_2-call.S
-@@ -0,0 +1,24 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Copyright (C) 2019 Arm Ltd.
-+ */
-+
-+#include <linux/linkage.h>
-+
-+.macro SMC_CALL conduit
-+	\conduit #0
-+	ldr x8, [sp]
-+	stp x0, x1, [x8]
-+	stp x2, x3, [x8, #16]
-+	stp x4, x5, [x8, #32]
-+	stp x6, x7, [x8, #48]
-+	ret
-+.endm
-+
-+ENTRY(__arm_smcccv1_2_hvc)
-+	SMC_CALL hvc
-+ENDPROC(__arm_smcccv1_2_hvc)
-+
-+ENTRY(__arm_smcccv1_2_smc)
-+	SMC_CALL smc
-+ENDPROC(__arm_smcccv1_2_smc)
-diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
-index 1bc0e965f2e9..3bcf3d4514e4 100644
---- a/drivers/firmware/Kconfig
-+++ b/drivers/firmware/Kconfig
-@@ -77,6 +77,17 @@ config ARM_SDE_INTERFACE
- 	  standard for registering callbacks from the platform firmware
- 	  into the OS. This is typically used to implement RAS notifications.
-=20
-+config ARM_FFA_TRANSPORT
-+	bool "ARM Secure Partition Client Interface (FFA)"
-+	depends on ARM64 || ARM
-+	help
-+	  The Secure Partition Client Interface (FFA) is an Arm standard for
-+	  communication and memory sharing between entities managed by SMCCC
-+	  compliant firmware.
-+
-+	  This driver provides interface for all the client drivers making
-+	  use of the features offered by FFA.
-+
- config EDD
- 	tristate "BIOS Enhanced Disk Drive calls determine boot disk"
- 	depends on X86
-diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
-index 64f5391e5749..10041c5f4d07 100644
---- a/drivers/firmware/Makefile
-+++ b/drivers/firmware/Makefile
-@@ -29,6 +29,7 @@ obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o
-=20
- obj-$(CONFIG_ARM_SCMI_PROTOCOL)	+=3D arm_scmi/
- obj-y				+=3D psci/
-+obj-y				+=3D ffa/
- obj-y				+=3D broadcom/
- obj-y				+=3D meson/
- obj-$(CONFIG_GOOGLE_FIRMWARE)	+=3D google/
-diff --git a/drivers/firmware/ffa/Makefile b/drivers/firmware/ffa/Makefile
-new file mode 100644
-index 000000000000..37f4ccae197b
---- /dev/null
-+++ b/drivers/firmware/ffa/Makefile
-@@ -0,0 +1,6 @@
-+# SPDX-License-Identifier: GPL-2.0
-+#
-+# Makefile for the linux kernel.
-+#
-+obj-$(CONFIG_ARM_FFA_TRANSPORT)	+=3D arm_ffa.o
-+ccflags-y +=3D -Og
-diff --git a/drivers/firmware/ffa/arm_ffa.c b/drivers/firmware/ffa/arm_ffa=
.c
-new file mode 100644
-index 000000000000..21838f8c4632
---- /dev/null
-+++ b/drivers/firmware/ffa/arm_ffa.c
-@@ -0,0 +1,782 @@
-+// SPDX-License-Identifier: GPL-2.0-only
-+/*
-+ * Secure Partitions Communication Interface (FFA) Protocol driver
-+ *
-+ * FFA is a system message passing and memory sharing protocol allowing f=
or
-+ * execution contexts to exchange information with other execution contex=
ts
-+ * residing on other Secure Partitions or Virtual Machines managed by any=
 FFA
-+ * compliant firmware framework.
-+ *
-+ * Copyright (C) 2019, 2020 Arm Ltd.
-+ */
-+#define DEBUG
-+
-+#include <linux/platform_device.h>
-+#include <linux/arm_ffa.h>
-+#include <linux/arm-smcccv1_2.h>
-+#include <linux/of_address.h>
-+#include <linux/of_platform.h>
-+#include <linux/module.h>
-+#include <linux/mm.h>
-+#include <linux/mutex.h>
-+#include <linux/slab.h>
-+#include <linux/scatterlist.h>
-+
-+
-+static DEFINE_MUTEX(rx_lock);
-+static DEFINE_MUTEX(tx_lock);
-+
-+static ffa_sp_id_t vm_id;
-+
-+static struct page *rx_buffer;
-+static struct page *tx_buffer;
-+
-+static struct arm_smcccv1_2_return
-+(*arm_ffa_smccc)(u32 func, u64 arg1, u64 arg2, u64 arg3, u64 arg4,
-+		  u64 arg5, u64 arg6, u64 arg7);
-+
-+#define FFA_DEFINE_CALL(conduit)					\
-+static struct arm_smcccv1_2_return					\
-+arm_ffa_##conduit(u32 func, u64 arg1, u64 arg2, u64 arg3, u64 arg4,	\
-+		   u64 arg5, u64 arg6, u64 arg7)			\
-+{									\
-+	struct arm_smcccv1_2_return smccc_ret;				\
-+									\
-+	__arm_smcccv1_2_##conduit(func, arg1, arg2, arg3, arg4, arg5,	\
-+				  arg6,	arg7, &smccc_ret);		\
-+									\
-+	return smccc_ret;						\
-+}
-+
-+FFA_DEFINE_CALL(smc)
-+FFA_DEFINE_CALL(hvc)
-+
-+static u32 sender_receiver_pack(u32 src_id, u32 dst_id)
-+{
-+	return (((src_id << 16) & 0xffff0000) | (dst_id & 0xffff));
-+}
-+
-+int ffa_msg_send(ffa_sp_id_t dst_id, u32 len, u32 attributes)
-+{
-+	struct arm_smcccv1_2_return msg_send_return;
-+
-+	/* w1[32:16] Sender endpoint ID, w1[15:0] destination endpoint id. */
-+	u32 sender_receiver =3D sender_receiver_pack(vm_id, dst_id);
-+
-+	msg_send_return =3D arm_ffa_smccc(FFA_MSG_SEND_32, sender_receiver,
-+					 0, len, attributes, 0, 0, 0);
-+
-+	if (msg_send_return.arg0  =3D=3D FFA_ERROR_32) {
-+		switch ((int)msg_send_return.arg2) {
-+		case FFA_INVALID_PARAMETERS:
-+			return -ENXIO;
-+		case FFA_DENIED:
-+		case FFA_BUSY:
-+			return -EAGAIN;
-+		default:
-+			panic("%s: Unhandled return code (%lld)\n", __func__,
-+			      msg_send_return.arg2);
-+		}
-+	}
-+	return 0;
-+}
-+
-+struct arm_smcccv1_2_return
-+ffa_msg_send_direct_req(ffa_sp_id_t dst_id, u64 w3, u64 w4, u64 w5,
-+			 u64 w6, u64 w7)
-+{
-+	struct arm_smcccv1_2_return ret;
-+
-+	/* w1[32:16] Sender endpoint ID, w1[15:0] destination endpoint id. */
-+	u32 sender_receiver =3D sender_receiver_pack(vm_id, dst_id);
-+
-+	ret =3D arm_ffa_smccc(FFA_MSG_SEND_DIRECT_REQ_32, sender_receiver, 0,
-+			     w3, w4, w5, w6, w7);
-+
-+	while (ret.arg0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 &&
-+		ret.arg0 !=3D FFA_SUCCESS_32) {
-+		if (ret.arg0 =3D=3D FFA_ERROR_32) {
-+			pr_err("%s: Error sending message %llu\n", __func__,
-+				ret.arg0);
-+			switch ((int)ret.arg1) {
-+			case FFA_INVALID_PARAMETERS:
-+				ret.arg0 =3D -ENXIO;
-+				goto out;
-+
-+			case FFA_DENIED:
-+			case FFA_NOT_SUPPORTED:
-+				ret.arg0 =3D -EIO;
-+				goto out;
-+
-+			case FFA_BUSY:
-+				ret.arg0 =3D -EAGAIN;
-+				goto out;
-+			}
-+		} else if (ret.arg0 =3D=3D FFA_INTERRUPT_32) {
-+			ret =3D arm_ffa_smccc(FFA_RUN_32, ret.arg1,
-+				0, 0, 0, 0, 0, 0);
-+		}
-+
-+	}
-+
-+	ret.arg0 =3D 0;
-+
-+out:
-+	return ret;
-+}
-+
-+static int ffa_share_next_frag(u64 handle, u32 frag_len, u32 *tx_offset)
-+{
-+
-+	struct arm_smcccv1_2_return smccc_return;
-+	u32 handle_high =3D (handle >> 32) & 0xffffffff;
-+	u32 handle_low =3D handle & 0xffffffff;
-+
-+	smccc_return =3D
-+		arm_ffa_smccc(FFA_MEM_FRAG_TX_32, handle_low,
-+			handle_high, frag_len, 0, 0, 0, 0);
-+
-+	while (smccc_return.arg0 !=3D FFA_MEM_FRAG_RX_32) {
-+
-+		if (smccc_return.arg0 =3D=3D FFA_ERROR_32) {
-+			switch ((int)smccc_return.arg2) {
-+			case FFA_INVALID_PARAMETERS:
-+				return -ENXIO;
-+			case FFA_NOT_SUPPORTED:
-+				return -ENODEV;
-+			default:
-+				pr_warn("%s: Unknown Error code %llx\n",
-+					__func__, smccc_return.arg2);
-+				return -EIO;
-+			}
-+		}
-+
-+		if (smccc_return.arg0 =3D=3D FFA_MEM_OP_PAUSE_32) {
-+
-+			smccc_return =3D arm_ffa_smccc(FFA_MEM_OP_RESUME_32,
-+				smccc_return.arg1, smccc_return.arg2, 0, 0, 0,
-+				0, 0);
-+		}
-+	}
-+
-+	*tx_offset =3D smccc_return.arg3;
-+
-+	return 0;
-+}
-+
-+static int ffa_share_init_frag(phys_addr_t buffer, u32 buffer_size,
-+	u32 fragment_len, u32 total_len, u64 *handle)
-+{
-+
-+	struct arm_smcccv1_2_return smccc_return;
-+
-+	smccc_return =3D
-+		arm_ffa_smccc(FFA_MEM_SHARE_64, total_len, fragment_len, buffer,
-+		buffer_size, 0, 0, 0);
-+
-+	while (smccc_return.arg0 !=3D FFA_SUCCESS_32) {
-+
-+		if (smccc_return.arg0 =3D=3D FFA_ERROR_32) {
-+			switch ((int)smccc_return.arg2) {
-+			case FFA_INVALID_PARAMETERS:
-+				return -ENXIO;
-+			case FFA_DENIED:
-+				return -EIO;
-+			case FFA_NO_MEMORY:
-+				return -ENOMEM;
-+			case FFA_ABORTED:
-+				return -EAGAIN;
-+			default:
-+				pr_warn("%s: Unknown Error code %llx\n",
-+					__func__, smccc_return.arg2);
-+				return -EIO;
-+			}
-+		}
-+
-+		if (smccc_return.arg0 =3D=3D FFA_MEM_OP_PAUSE_32) {
-+
-+			smccc_return =3D arm_ffa_smccc(FFA_MEM_OP_RESUME_32,
-+				smccc_return.arg1, smccc_return.arg2, 0, 0, 0,
-+				0, 0);
-+		}
-+	}
-+
-+	*handle =3D (smccc_return.arg3 << 32) | smccc_return.arg2;
-+
-+	return 0;
-+}
-+
-+static inline u32 compute_composite_offset(u32 num_attributes)
-+{
-+	u32 composite_offset =3D offsetof(struct ffa_mem_region,
-+		endpoints[num_attributes]);
-+
-+	/* ensure composite are 8 byte aligned. */
-+	if (composite_offset & 0x7)
-+		return (composite_offset & (~(u32)0x7)) + 0x8;
-+
-+	return composite_offset;
-+}
-+
-+static inline u32 compute_constituent_offset(u32 num_attributes)
-+{
-+	u32 constituent_offset =3D offsetof(struct ffa_mem_region,
-+		endpoints[num_attributes]) +
-+		offsetof(struct ffa_composite_memory_region, constituents[0]);
-+
-+	/* ensure constituents are 8 byte aligned. */
-+	if (constituent_offset & 0x7)
-+		return (constituent_offset & (~(u32)0x7)) + 0x8;
-+
-+	return constituent_offset;
-+}
-+
-+static inline u32 compute_region_length(u32 num_constituents,
-+	u32 num_attributes)
-+{
-+	/* This assumes that there is a single ffa_composite_memory_region. */
-+	return compute_constituent_offset(num_attributes) +
-+		sizeof(struct ffa_mem_region_constituent)*num_constituents;
-+}
-+
-+static int ffa_rx_release(void)
-+{
-+	struct arm_smcccv1_2_return rx_release_return;
-+
-+	rx_release_return =3D arm_ffa_smccc(FFA_RX_RELEASE_32,
-+					      0, 0, 0, 0, 0, 0, 0);
-+
-+	if (rx_release_return.arg0 =3D=3D FFA_ERROR_32) {
-+		switch ((int)rx_release_return.arg2) {
-+		case FFA_DENIED:
-+			return -EAGAIN;
-+		default:
-+			panic("%s: Unhandled return code (%lld)\n", __func__,
-+			      rx_release_return.arg2);
-+		}
-+	}
-+
-+	if (rx_release_return.arg0 =3D=3D FFA_RX_RELEASE_32) {
-+		/*
-+		 * FFA implementation returned FFA_RX_RELEASE which signals
-+		 * the PVM that other VMs need to be scheduled.
-+		 */
-+		return 1;
-+	}
-+
-+	return 0;
-+}
-+
-+static uint32_t ffa_get_num_pages_sg(struct scatterlist *sg)
-+{
-+	uint32_t num_pages =3D 0;
-+
-+	do {
-+		num_pages +=3D sg->length/PAGE_SIZE;
-+	} while ((sg =3D sg_next(sg)));
-+
-+	return num_pages;
-+}
-+
-+static inline struct ffa_memory_region_attribute ffa_set_region_normal(
-+	enum ffa_mem_cacheability cacheability,
-+	enum ffa_mem_shareability shareability)
-+{
-+	struct ffa_memory_region_attribute attr =3D {0};
-+
-+	attr.attribute =3D (FFA_MEM_NORMAL << FFA_MEMTYPE_OFFSET) |
-+		(cacheability << FFA_CACHEABILITY_OFFSET) | shareability;
-+
-+	return attr;
-+}
-+
-+static inline struct ffa_memory_region_attribute ffa_set_region_device(
-+	enum ffa_mem_device_type device_type)
-+{
-+	struct ffa_memory_region_attribute attr =3D {0};
-+
-+	attr.attribute =3D (FFA_MEM_DEVICE << FFA_MEMTYPE_OFFSET) |
-+		(device_type << FFA_DEVICE_OFFSET);
-+
-+	return attr;
-+}
-+
-+static inline int ffa_transmit_fragment(u32 *tx_offset, phys_addr_t buffe=
r,
-+	u32 buffer_size, u32 frag_len, u32 total_len, u64 *handle)
-+{
-+	int rc;
-+
-+	if (*tx_offset =3D=3D 0) {
-+		rc =3D ffa_share_init_frag(buffer, buffer_size,
-+			frag_len, total_len, handle);
-+
-+		*tx_offset =3D frag_len;
-+	} else
-+		rc =3D ffa_share_next_frag(*handle, frag_len, tx_offset);
-+
-+
-+	return rc;
-+}
-+
-+/*
-+ * Share a set of pages with a list of destination endpoints.
-+ * Returns a system-wide unique handle
-+ */
-+static int _ffa_share_memory(u32 tag, enum mem_clear_t flags,
-+	struct ffa_mem_region_attributes *attrs,
-+	u32 num_attrs, struct scatterlist *sg, u32 nents,
-+	ffa_mem_handle_t *handle, phys_addr_t buffer, uint32_t buffer_size)
-+{
-+	struct ffa_mem_region *mem_region;
-+	u32 index;
-+	u32 num_constituents;
-+	struct ffa_mem_region_constituent *constituents;
-+	u32 total_len;
-+	u32 fragment_len =3D sizeof(struct ffa_mem_region);
-+	u32 max_fragment_size;
-+	int rc =3D 0;
-+	u32 tx_offset =3D 0;
-+	struct ffa_composite_memory_region *composite =3D NULL;
-+
-+	if (buffer) {
-+
-+		BUG_ON(!buffer_size);
-+		max_fragment_size =3D buffer_size * FFA_BASE_GRANULE_SIZE;
-+		mem_region =3D phys_to_virt(buffer);
-+
-+	} else {
-+
-+		BUG_ON(buffer_size);
-+		mem_region =3D (struct ffa_mem_region *)page_address(tx_buffer);
-+		max_fragment_size =3D FFA_BASE_GRANULE_SIZE;
-+
-+	}
-+
-+	mem_region->flags =3D flags;
-+	mem_region->tag =3D tag;
-+	mem_region->sender_id =3D vm_id;
-+	mem_region->region_attr =3D ffa_set_region_normal(FFA_WRITE_BACK,
-+		FFA_INNER_SHAREABLE);
-+	composite =3D ffa_get_composite(mem_region, num_attrs);
-+	composite->total_page_count =3D ffa_get_num_pages_sg(sg);
-+
-+	fragment_len =3D compute_constituent_offset(num_attrs);
-+
-+	/* Ensure attribute description fits within the Tx buffer. */
-+	if (fragment_len > max_fragment_size)
-+		return -ENXIO;
-+
-+	constituents =3D (struct ffa_mem_region_constituent *)
-+		(((void *)mem_region) + fragment_len);
-+
-+	composite->constituent_count =3D nents;
-+	total_len =3D compute_region_length(nents, num_attrs);
-+
-+	for (index =3D 0; index < num_attrs; index++) {
-+		mem_region->endpoints[index].receiver =3D attrs[index].receiver;
-+		mem_region->endpoints[index].attrs =3D
-+			attrs[index].attrs;
-+
-+		mem_region->endpoints[index].composite_off =3D
-+			compute_composite_offset(num_attrs);
-+	}
-+	mem_region->endpoint_count =3D num_attrs;
-+
-+	num_constituents =3D 0;
-+
-+	do {
-+		phys_addr_t address;
-+
-+		/*
-+		 * If current fragment size equal Tx size trigger fragment
-+		 * transfer.
-+		 */
-+		if (fragment_len =3D=3D max_fragment_size) {
-+
-+			/* Transmit fragment. */
-+			rc =3D ffa_transmit_fragment(&tx_offset, buffer,
-+				buffer_size, fragment_len, total_len, handle);
-+
-+			if (rc < 0)
-+				return -ENXIO;
-+
-+
-+			constituents =3D
-+				(struct ffa_mem_region_constituent *)mem_region;
-+
-+			num_constituents =3D 0;
-+			fragment_len =3D 0;
-+		}
-+
-+		address =3D sg_phys(sg);
-+
-+		/*
-+		 * Detect if any part of the constituent region surpasses the Tx
-+		 * region.
-+		 */
-+		if (((void *) &constituents[num_constituents])
-+			- (void *)mem_region > max_fragment_size) {
-+			pr_err("%s: memory region fragment greater that the Tx buffer",
-+				__func__);
-+			return -EFAULT;
-+		}
-+#if 0
-+		pr_devel("arm_ffa mem_share pa=3D%#lX\n", address);
-+#endif
-+		constituents[num_constituents].address =3D address;
-+		constituents[num_constituents].page_count =3D
-+			sg->length/PAGE_SIZE;
-+		num_constituents++;
-+		fragment_len +=3D sizeof(struct ffa_mem_region_constituent);
-+
-+
-+	} while ((sg =3D sg_next(sg)));
-+
-+	rc =3D ffa_transmit_fragment(&tx_offset, buffer, buffer_size,
-+		fragment_len, total_len, handle);
-+
-+	return rc;
-+}
-+
-+/*
-+ * Share a set of pages with a list of destination endpoints.
-+ *
-+ * Returns a system-wide unique handle
-+ */
-+static int ffa_share_memory(u32 tag, enum mem_clear_t flags,
-+	struct ffa_mem_region_attributes *attrs,
-+	u32 num_attrs, struct scatterlist *sg, u32 nents,
-+	ffa_mem_handle_t *global_handle, bool use_tx)
-+{
-+	u32 buffer_size =3D 0;
-+	phys_addr_t buffer_pa =3D 0;
-+	int ret;
-+	struct page *buffer_page =3D NULL;
-+
-+	if (!use_tx) {
-+		/* Allocate buffer for this mem_share operation. */
-+		buffer_page =3D alloc_page(GFP_KERNEL);
-+		if (IS_ERR_OR_NULL(buffer_page)) {
-+			/* print error. Return as tx lock is not held. */
-+			pr_err("%s: unable to allocate buffer", __func__);
-+			return -ENOMEM;
-+		}
-+
-+		buffer_pa =3D page_to_phys(buffer_page);
-+
-+		buffer_size =3D 1;
-+	}
-+
-+	if (use_tx)
-+		mutex_lock(&tx_lock);
-+
-+	ret =3D _ffa_share_memory(tag, flags, attrs, num_attrs, sg, nents,
-+		global_handle, buffer_pa, buffer_size);
-+
-+	if (use_tx)
-+		mutex_unlock(&tx_lock);
-+
-+	return ret;
-+}
-+
-+static int ffa_memory_reclaim(ffa_mem_handle_t global_handle,
-+	enum mem_clear_t flags)
-+{
-+
-+	struct arm_smcccv1_2_return smccc_return;
-+	u32 handle_high =3D (global_handle >> 32) & 0xffffffff;
-+	u32 handle_low =3D global_handle & 0xffffffff;
-+
-+	smccc_return =3D arm_ffa_smccc(FFA_MEM_RECLAIM_32, handle_low,
-+		handle_high, flags, 0, 0, 0, 0);
-+
-+	if (smccc_return.arg0 =3D=3D FFA_ERROR_32) {
-+		pr_err("%s: Error sending message %llu\n", __func__,
-+			smccc_return.arg0);
-+		switch ((int)smccc_return.arg2) {
-+		case FFA_INVALID_PARAMETERS:
-+			return -ENXIO;
-+		case FFA_DENIED:
-+		case FFA_NOT_SUPPORTED:
-+			return -EIO;
-+		case FFA_BUSY:
-+			return -EAGAIN;
-+		default:
-+			pr_warn("%s: Unknown Error code %llx\n", __func__,
-+				smccc_return.arg2);
-+			return -EIO;
-+		}
-+	}
-+
-+	return 0;
-+}
-+
-+/*
-+ * Returns a negative value if function not supported. Otherwise returns =
w2,
-+ * supplying optional feature parameter else 0.
-+ */
-+
-+static int ffa_features(uint32_t function_id)
-+{
-+	struct arm_smcccv1_2_return features_return =3D
-+		arm_ffa_smccc(FFA_FEATURES_32, function_id, 0, 0, 0, 0, 0, 0);
-+
-+	if (features_return.arg0 =3D=3D FFA_ERROR_32) {
-+		switch ((int)features_return.arg2) {
-+		case FFA_NOT_SUPPORTED:
-+			return -ENODEV;
-+		default:
-+			panic("%s: Unhandled return code (%lld)\n", __func__,
-+			      features_return.arg2);
-+		}
-+	} else {
-+		return features_return.arg2;
-+	}
-+}
-+
-+static ffa_sp_id_t ffa_id_get(ffa_sp_id_t *vm_id_p)
-+{
-+	struct  arm_smcccv1_2_return id_get_return =3D
-+		arm_ffa_smccc(FFA_ID_GET_32, 0, 0, 0, 0, 0, 0, 0);
-+
-+	if (id_get_return.arg0 =3D=3D FFA_ERROR_32) {
-+		pr_warn("%s: failed to obtain vm id\n", __func__);
-+		return -EIO;
-+	}
-+
-+	*vm_id_p =3D id_get_return.arg2 & 0xffff;
-+
-+	return 0;
-+}
-+
-+static int ffa_partition_info_get(uint32_t uuid0, uint32_t uuid1,
-+				     uint32_t uuid2, uint32_t uuid3,
-+				     struct ffa_partition_info **buffer)
-+{
-+	int rc =3D 0;
-+	uint32_t count;
-+	struct ffa_partition_info *info =3D
-+		(struct ffa_partition_info *) page_address(rx_buffer);
-+	struct arm_smcccv1_2_return partition_info_get_return;
-+
-+	mutex_lock(&rx_lock);
-+	partition_info_get_return =3D arm_ffa_smccc(FFA_PARTITION_INFO_GET_32,
-+						   uuid0, uuid1, uuid2, uuid3,
-+						   0, 0, 0);
-+
-+	if (partition_info_get_return.arg0 =3D=3D FFA_ERROR_32) {
-+		switch ((int)partition_info_get_return.arg2) {
-+		case FFA_INVALID_PARAMETERS:
-+			rc =3D -ENXIO;
-+			goto err;
-+		case FFA_NO_MEMORY:
-+			rc =3D -ENOMEM;
-+			goto err;
-+		case FFA_NOT_SUPPORTED:
-+			rc =3D -ENODEV;
-+			goto err;
-+		default:
-+			panic("%s: Unhandled return code (%lld)\n", __func__,
-+			      partition_info_get_return.arg2);
-+		}
-+	}
-+
-+	count =3D partition_info_get_return.arg2;
-+
-+	/* Allocate and copy the info structs.
-+	 * Client is responsible for freeing.
-+	 */
-+	*buffer =3D kzalloc(sizeof(struct ffa_partition_info) * count,
-+			  GFP_KERNEL);
-+	if (*buffer =3D=3D NULL) {
-+		rc =3D -ENOMEM;
-+		goto err;
-+	}
-+	memcpy(*buffer, info, sizeof(struct ffa_partition_info) * count);
-+
-+	ffa_rx_release();
-+
-+	rc =3D count;
-+err:
-+	mutex_unlock(&rx_lock);
-+
-+	return rc;
-+}
-+
-+static struct ffa_ops ffa_ops =3D {
-+	.async_msg_send =3D ffa_msg_send,
-+	.sync_msg_send =3D ffa_msg_send_direct_req,
-+	.mem_share =3D ffa_share_memory,
-+	.mem_reclaim =3D ffa_memory_reclaim,
-+	.partition_info_get =3D ffa_partition_info_get,
-+};
-+
-+struct ffa_ops *get_ffa_ops(void)
-+{
-+	return &ffa_ops;
-+}
-+EXPORT_SYMBOL_GPL(get_ffa_ops);
-+
-+static int ffa_dt_init(struct device_node *np)
-+{
-+	const char *conduit;
-+
-+	pr_info("FFA: obtaining conduit from DT.\n");
-+
-+	if (of_property_read_string(np, "conduit", &conduit)) {
-+		pr_warn("FFA: cannot find conduit in DT\n");
-+		return -ENXIO;
-+	}
-+
-+	if (!strcmp("smc", conduit))
-+		arm_ffa_smccc =3D arm_ffa_smc;
-+	else if (!strcmp("hvc", conduit))
-+		arm_ffa_smccc =3D arm_ffa_hvc;
-+	else {
-+		pr_warn("%s: unrecognized FFA conduit\n", __func__);
-+		return -EIO;
-+	}
-+
-+	return 0;
-+}
-+
-+static const struct of_device_id ffa_of_match[] =3D {
-+	{.compatible =3D "arm,ffa"},
-+	{},
-+};
-+
-+static int ffa_rxtx_map(uintptr_t tx_page, uintptr_t rx_page)
-+{
-+	struct arm_smcccv1_2_return map_return;
-+
-+	map_return =3D arm_ffa_smccc(FFA_RXTX_MAP_32, tx_page,
-+					 rx_page, 1, 0, 0, 0, 0);
-+
-+	if (map_return.arg0 =3D=3D FFA_ERROR_32) {
-+		switch ((int)map_return.arg2) {
-+		case FFA_INVALID_PARAMETERS:
-+			return -ENXIO;
-+		case FFA_DENIED:
-+			return -EAGAIN;
-+		case FFA_NO_MEMORY:
-+			return -ENOMEM;
-+		case FFA_NOT_SUPPORTED:
-+			return -ENODEV;
-+
-+		default:
-+			panic("%s: Unhandled return code (%lld)\n", __func__,
-+			      map_return.arg2);
-+		}
-+	}
-+
-+	return 0;
-+}
-+
-+static int ffa_version_check(void)
-+{
-+	struct arm_smcccv1_2_return version_return;
-+	u16 major =3D 1;
-+	u16 minor =3D 0;
-+	u32 hv_version;
-+
-+	version_return =3D arm_ffa_smccc(FFA_VERSION_32, ((u32)major<<16)|minor,
-+		 0, 0, 0, 0, 0, 0);
-+
-+	if ((int)version_return.arg0 =3D=3D FFA_NOT_SUPPORTED) {
-+		pr_err("%s: FFA ABI is not supported at higher exception levels\n",
-+			__func__);
-+		return -ENODEV;
-+	}
-+
-+	hv_version =3D version_return.arg0;
-+
-+	if ((hv_version>>16) =3D=3D major)
-+		if ((hv_version & 0xffff) >=3D minor)
-+			return 0;
-+
-+	pr_err("%s: incompatible FFA ABI at higher exception level (%x)\n",
-+		__func__, hv_version);
-+	return -ENODEV;
-+}
-+
-+static int ffa_probe(struct platform_device *pdev)
-+{
-+	int ret;
-+
-+	ret =3D ffa_dt_init(pdev->dev.of_node);
-+	if (ret) {
-+		pr_warn("%s: FFA driver initialization failed\n", __func__);
-+		return ret;
-+	}
-+
-+	ret =3D ffa_version_check();
-+	if (ret)
-+		return ret;
-+
-+	/* Initialize VM ID. */
-+	ret =3D ffa_id_get(&vm_id);
-+	if (ret) {
-+		pr_warn("%s: failed to obtain own FFA endpoint ID\n", __func__);
-+		return ret;
-+	}
-+
-+	if (ffa_features(FFA_MSG_SEND_DIRECT_REQ_32)) {
-+		pr_err("%s: FFA implementation at EL2 does not support FFA_MSG_SEND_DIR=
ECT_REQ_32\n",
-+			__func__);
-+		return -ENXIO;
-+	}
-+
-+	/* Allocate Rx buffer. */
-+	rx_buffer =3D alloc_page(GFP_KERNEL);
-+
-+	/*
-+	 * Ensure buffer was correctly allocated and that the refcout was
-+	 * incremented.
-+	 */
-+	if (!rx_buffer || !try_get_page(rx_buffer)) {
-+		pr_err("%s: failed to allocate FFA Rx buffer\n", __func__);
-+		return -ENOMEM;
-+	}
-+
-+	/* Allocate Tx buffer. */
-+	tx_buffer =3D alloc_page(GFP_KERNEL);
-+
-+	/*
-+	 * Ensure buffer was correctly allocated and that the refcout was
-+	 * incremented.
-+	 */
-+	if (!tx_buffer || !try_get_page(rx_buffer)) {
-+		put_page(rx_buffer);
-+		__free_page(rx_buffer);
-+
-+		pr_err("%s: failed to allocate FFA Tx buffer\n", __func__);
-+		return -ENOMEM;
-+	}
-+
-+	/* Register the RxTx buffers with the FFA supervisor implementation. */
-+	ret =3D ffa_rxtx_map(page_to_phys(tx_buffer), page_to_phys(rx_buffer));
-+	if (ret) {
-+		put_page(rx_buffer);
-+		put_page(tx_buffer);
-+		__free_page(rx_buffer);
-+		__free_page(tx_buffer);
-+
-+		pr_err("%s: failed to register FFA RxTx buffers\n", __func__);
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+static struct platform_driver ffa_driver =3D {
-+	.driver =3D {
-+		.name =3D "ffa_protocol",
-+		.of_match_table =3D ffa_of_match,
-+	},
-+	.probe =3D ffa_probe,
-+};
-+module_platform_driver(ffa_driver);
-+
-+MODULE_AUTHOR("Arm");
-+MODULE_DESCRIPTION("Arm FFA transport driver");
-+MODULE_LICENSE("GPL v2");
-diff --git a/include/linux/arm-smcccv1_2.h b/include/linux/arm-smcccv1_2.h
-new file mode 100644
-index 000000000000..a622cc352ae1
---- /dev/null
-+++ b/include/linux/arm-smcccv1_2.h
-@@ -0,0 +1,51 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Copyright (C) 2019 Arm Ltd.
-+ */
-+
-+//#if defined(ARM64)
-+#if CONFIG_ARM64=20
-+struct arm_smcccv1_2_return {
-+	u64 arg0;
-+	u64 arg1;
-+	u64 arg2;
-+	u64 arg3;
-+	u64 arg4;
-+	u64 arg5;
-+	u64 arg6;
-+	u64 arg7;
-+};
-+#elif CONFIG_ARM
-+struct arm_smcccv1_2_return {
-+	u32 arg0;
-+	u32 arg1;
-+	u32 arg2;
-+	u32 arg3;
-+	u32 arg4;
-+	u32 arg5;
-+	u32 arg6;
-+	u32 arg7;
-+};
-+#endif
-+
-+/**
-+ * __arm_smcccv1_2_hvc() - make HVC calls
-+ * @a0-a7: arguments passed in registers 0 to 7
-+ * @res: result values from registers 0 to 7
-+ */
-+asmlinkage
-+void __arm_smcccv1_2_hvc(unsigned long a0, unsigned long a1, unsigned lon=
g a2,
-+			 unsigned long a3, unsigned long a4, unsigned long a5,
-+			 unsigned long a6, unsigned long a7,
-+			 struct arm_smcccv1_2_return  *res);
-+
-+/**
-+ * __arm_smcccv1_2_smc() - make SMC calls
-+ * @a0-a7: arguments passed in registers 0 to 7
-+ * @res: result values from registers 0 to 7
-+ */
-+asmlinkage
-+void __arm_smcccv1_2_smc(unsigned long a0, unsigned long a1, unsigned lon=
g a2,
-+			 unsigned long a3, unsigned long a4, unsigned long a5,
-+			 unsigned long a6, unsigned long a7,
-+			 struct arm_smcccv1_2_return  *res);
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-new file mode 100644
-index 000000000000..d3c80b7f9e07
---- /dev/null
-+++ b/include/linux/arm_ffa.h
-@@ -0,0 +1,235 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+/*
-+ * Copyright (C) 2019, 2020 Arm Ltd.
-+ */
-+
-+#ifndef __LINUX_ARM_FFA_H
-+#define __LINUX_ARM_FFA_H
-+
-+#define FFA_ERROR_32                 0x84000060
-+#define FFA_SUCCESS_32               0x84000061
-+#define FFA_INTERRUPT_32             0x84000062
-+#define FFA_VERSION_32               0x84000063
-+#define FFA_FEATURES_32              0x84000064
-+#define FFA_RX_RELEASE_32            0x84000065
-+#define FFA_RXTX_MAP_32              0x84000066
-+
-+#define FFA_PARTITION_INFO_GET_32    0x84000068
-+#define FFA_ID_GET_32                0x84000069
-+
-+#define FFA_RUN_32                   0x8400006D
-+#define FFA_MSG_SEND_32              0x8400006E
-+#define FFA_MSG_SEND_DIRECT_REQ_32   0x8400006F
-+#define FFA_MSG_SEND_DIRECT_RESP_32  0x84000070
-+#define FFA_MEM_RECLAIM_32           0x84000077
-+#define FFA_MEM_OP_PAUSE_32          0x84000078
-+#define FFA_MEM_OP_RESUME_32         0x84000079
-+
-+#define FFA_MEM_SHARE_64             0xC4000073
-+
-+#define FFA_MEM_FRAG_RX_32			  0x8400007A
-+#define FFA_MEM_FRAG_TX_32			  0x8400007B
-+
-+/* FFA error codes. */
-+#define FFA_SUCCESS            (0)
-+#define FFA_NOT_SUPPORTED      (-1)
-+#define FFA_INVALID_PARAMETERS (-2)
-+#define FFA_NO_MEMORY          (-3)
-+#define FFA_BUSY               (-4)
-+#define FFA_INTERRUPTED        (-5)
-+#define FFA_DENIED             (-6)
-+#define FFA_RETRY              (-7)
-+#define FFA_ABORTED            (-8)
-+
-+#define FFA_BASE_GRANULE_SIZE 4096
-+
-+struct scatterlist;
-+
-+enum ffa_mem_permission {
-+	FFA_MEM_R   =3D 0x1,
-+	FFA_MEM_RW  =3D 0x2,
-+	FFA_MEM_XN  =3D 0x4,
-+	FFA_MEM_X   =3D 0x8,
-+};
-+
-+#define FFA_MEMTYPE_OFFSET 4
-+enum ffa_mem_type {
-+	FFA_MEM_DEVICE =3D 0x1,
-+	FFA_MEM_NORMAL =3D 0x2,
-+};
-+
-+
-+#define FFA_CACHEABILITY_OFFSET 2
-+enum ffa_mem_cacheability {
-+	FFA_NON_CACHEABLE =3D 0x1,
-+	FFA_WRITE_BACK =3D 0x3,
-+};
-+
-+enum ffa_mem_shareability {
-+	FFA_NON_SHAREABLE,
-+	FFA_OUTER_SHAREABLE =3D 0x2,
-+	FFA_INNER_SHAREABLE =3D 0x3,
-+};
-+
-+#define FFA_DEVICE_OFFSET 2
-+enum ffa_mem_device_type {
-+	FFA_NGNRNE,
-+	FFA_NGNRE,
-+	FFA_NGRE,
-+	FFA_GRE,
-+};
-+
-+enum mem_clear_t {
-+	FFA_KEEP_MEMORY,
-+	FFA_CLEAR_MEMORY,
-+};
-+
-+typedef u64 ffa_mem_handle_t;
-+
-+/* The type of an FFA endpoint ID */
-+typedef u16 ffa_sp_id_t;
-+
-+struct ffa_mem_region_constituent {
-+	u64 address;
-+	u32 page_count;
-+	u32 reserved_12_15;
-+};
-+
-+struct ffa_composite_memory_region {
-+
-+	uint32_t total_page_count;
-+	uint32_t constituent_count;
-+
-+	uint64_t reserved_0;
-+
-+	struct ffa_mem_region_constituent constituents[];
-+};
-+
-+struct ffa_mem_region_attributes {
-+	ffa_sp_id_t receiver;
-+	u8 attrs;
-+	u32 composite_off;
-+	u64 reserved_8_15;
-+};
-+
-+/* Table 43 */
-+struct ffa_memory_region_attribute {
-+	uint8_t attribute;
-+};
-+
-+struct ffa_mem_region {
-+	u16 sender_id;
-+	struct ffa_memory_region_attribute region_attr;
-+	u8 reserved_0;
-+	u32 flags;
-+	u64 handle;
-+	u64 tag;
-+	u32 reserved_1;
-+	u32 endpoint_count;
-+	struct ffa_mem_region_attributes endpoints[];
-+};
-+
-+static inline struct ffa_composite_memory_region *
-+ffa_get_composite(struct ffa_mem_region *mem_region, u32 num_endpoints)
-+{
-+	struct ffa_composite_memory_region *composite;
-+
-+	composite =3D (struct ffa_composite_memory_region *)
-+		(&mem_region->endpoints[num_endpoints]);
-+	return composite;
-+}
-+
-+
-+struct ffa_partition_info {
-+		/** The ID of the VM the information is about. */
-+		ffa_sp_id_t id;
-+		/**
-+		 * The number of execution contexts implemented by the
-+		 * partition.
-+		 */
-+		uint16_t execution_context;
-+		/**
-+		 * The Partition's properties, e.g. supported messaging
-+		 * methods
-+		 */
-+		uint32_t partition_properties;
-+};
-+
-+
-+/**
-+ * struct ffa_ops - represents the various FFA protocol operations
-+ * available for an SCPI endpoint.
-+ */
-+struct ffa_ops {
-+	int (*async_msg_send)(ffa_sp_id_t dst_id, u32 len, u32 attributes);
-+	struct arm_smcccv1_2_return
-+	(*sync_msg_send)(ffa_sp_id_t dst_id, u64 w3, u64 w4, u64 w5,
-+			 u64 w6, u64 w7);
-+
-+	/**
-+	 * Registers a memory region with the FFA implementation.
-+	 *
-+	 * Params:
-+	 *  - tag: Implementation defined value.
-+	 *  - flags:
-+	 *   - FFA_KEEP_MEMORY: DO not clear the memory region;
-+	 *   - FFA_CLEAR_MEMORY: Clear the memory region.
-+	 *  - attrs[]: Array of destination VMs and permissions with which the
-+	 *     Stage-2 mappings are set.
-+	 *  - num_attrs: Count of elements pointed to by attrs.
-+	 *  - sg: scatter list holding the pages to be shared.
-+	 *  - global_handle: A system-wide unique handle referring to the shared
-+	 *     set of physical pages being shared.
-+	 *  - use_tx: select if memorry region description is transmitted in tx
-+	 *     or in a dynamically allocated buffer. When using the tx buffer a
-+	 *     global lock on the tx buffer will be held.
-+	 *
-+	 * Return: 0 in case of success, otherwise a negative value
-+	 * (error code).
-+	 */
-+	int (*mem_share)(u32 tag, enum mem_clear_t flags,
-+			  struct ffa_mem_region_attributes attrs[],
-+			  u32 num_attrs, struct scatterlist *sg, u32 nents,
-+			  ffa_mem_handle_t *global_handle, bool use_tx);
-+
-+	/**
-+	 * Reclaims a memory region previously registered with the FFA
-+	 *  implementation.
-+	 * Params:
-+	 *  - global_handle: The global identifier of the memory region being
-+	 *     reclaimed.
-+	 *  - clear_memory: Set if the memory is meant to be cleared before
-+	 *     being mapped in the owner's Stage-2.
-+	 *
-+	 * Return: 0 in case of success, otherwise a negative value
-+	 * (error code).
-+	 */
-+	int (*mem_reclaim)(ffa_mem_handle_t global_handle,
-+		enum mem_clear_t flags);
-+	/**
-+	 * Returns information on a sub-set of partitions within a system
-+	 * identified by a UUID.
-+	 * Params:
-+	 *  - uuid0-3: The 128 bit UUID of the desired partition(s) represented
-+	 *              as 4 32 bit uints in form: uuid0-uuid1-uuid2-uuid3.
-+	 *  - ffa_partition_info**: A pointer to an array of
-+	 *	                     `ffa_parition_info` structs that will be
-+	 *	                     allocated and populated with the
-+	 *	                     discovered partitions information. The
-+	 *	                     caller is responsible for freeing the
-+	 *	                     memory allocated by the FFA driver.
-+	 * Return: The number of discovered partitions in the system and the
-+	 *	   length of the array of ffa_partition_info structs,
-+	 *	   otherwise a negative value (error code).
-+	 */
-+	int (*partition_info_get)(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
-+				   struct ffa_partition_info **buffer);
-+};
-+
-+#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
-+struct ffa_ops *get_ffa_ops(void);
-+#else
-+static inline struct ffa_ops *get_ffa_ops(void) { return NULL; }
-+#endif
-+
-+#endif /*__LINUX_ARM_FFA_H*/
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0010=
-tee-add-support-for-session-s-client-UUID-generation.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0010-tee-add-support-for-sessi=
on-s-client-UUID-generation.patch
deleted file mode 100644
index 269940e..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0010-tee-ad=
d-support-for-session-s-client-UUID-generation.patch
+++ /dev/null
@@ -1,252 +0,0 @@
-Upstream-Status: Backport [https://github.com/linaro-swg/linux/commit/e33b=
cbab16d1c0dd85d72bec275308369ad901f5#diff-317c0445401e56bde9d2ee0e0bb2758b0=
362a4099dca8e535dd20f1f649ecfc8]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 69a50f4234d8fb143d499e92e3f0f67009bae586 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
- <vesa.jaaskelainen@vaisala.com>
-Date: Wed, 22 Apr 2020 15:28:07 +0300
-Subject: [PATCH] tee: add support for session's client UUID generation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-TEE Client API defines that from user space only information needed for
-specified login operations is group identifier for group based logins.
-
-REE kernel is expected to formulate trustworthy client UUID and pass that
-to TEE environment. REE kernel is required to verify that provided group
-identifier for group based logins matches calling processes group
-memberships.
-
-TEE specification only defines that the information passed from REE
-environment to TEE environment is encoded into on UUID.
-
-In order to guarantee trustworthiness of client UUID user space is not
-allowed to freely pass client UUID.
-
-UUIDv5 form is used encode variable amount of information needed for
-different login types.
-
-Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
-Change-Id: I414f68d7485f95277d292fcb2646cc41bd57e62a
----
- drivers/tee/Kconfig     |   1 +
- drivers/tee/tee_core.c  | 143 ++++++++++++++++++++++++++++++++++++++++
- include/linux/tee_drv.h |  16 +++++
- 3 files changed, 160 insertions(+)
-
-diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
-index 676ffcb64985..5a56317f3f4e 100644
---- a/drivers/tee/Kconfig
-+++ b/drivers/tee/Kconfig
-@@ -3,6 +3,7 @@
- config TEE
- 	tristate "Trusted Execution Environment support"
- 	depends on HAVE_ARM_SMCCC || COMPILE_TEST
-+	select CRYPTO_SHA1
- 	select DMA_SHARED_BUFFER
- 	select GENERIC_ALLOCATOR
- 	help
-diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
-index 0f16d9ffd8d1..3d32a2ca48c3 100644
---- a/drivers/tee/tee_core.c
-+++ b/drivers/tee/tee_core.c
-@@ -6,18 +6,33 @@
- #define pr_fmt(fmt) "%s: " fmt, __func__
-=20
- #include <linux/cdev.h>
-+#include <linux/cred.h>
- #include <linux/fs.h>
- #include <linux/idr.h>
- #include <linux/module.h>
- #include <linux/slab.h>
- #include <linux/tee_drv.h>
- #include <linux/uaccess.h>
-+#include <crypto/hash.h>
-+#include <crypto/sha.h>
- #include "tee_private.h"
-=20
- #define TEE_NUM_DEVICES	32
-=20
- #define TEE_IOCTL_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))
-=20
-+#define TEE_UUID_NS_NAME_SIZE	128
-+
-+/*
-+ * TEE Client UUID name space identifier (UUIDv4)
-+ *
-+ * Value here is random UUID that is allocated as name space identifier f=
or
-+ * forming Client UUID's for TEE environment using UUIDv5 scheme.
-+ */
-+static const uuid_t tee_client_uuid_ns =3D UUID_INIT(0x58ac9ca0, 0x2086, =
0x4683,
-+						   0xa1, 0xb8, 0xec, 0x4b,
-+						   0xc0, 0x8e, 0x01, 0xb6);
-+
- /*
-  * Unprivileged devices in the lower half range and privileged devices in
-  * the upper half range.
-@@ -111,6 +126,134 @@ static int tee_release(struct inode *inode, struct f=
ile *filp)
- 	return 0;
- }
-=20
-+/**
-+ * uuid_v5() - Calculate UUIDv5
-+ * @uuid: Resulting UUID
-+ * @ns: Name space ID for UUIDv5 function
-+ * @name: Name for UUIDv5 function
-+ * @size: Size of name
-+ *
-+ * UUIDv5 is specific in RFC 4122.
-+ *
-+ * This implements section (for SHA-1):
-+ * 4.3.  Algorithm for Creating a Name-Based UUID
-+ */
-+static int uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-+		   size_t size)
-+{
-+	unsigned char hash[SHA1_DIGEST_SIZE];
-+	struct crypto_shash *shash =3D NULL;
-+	struct shash_desc *desc =3D NULL;
-+	int rc;
-+
-+	shash =3D crypto_alloc_shash("sha1", 0, 0);
-+	if (IS_ERR(shash)) {
-+		rc =3D PTR_ERR(shash);
-+		pr_err("shash(sha1) allocation failed\n");
-+		return rc;
-+	}
-+
-+	desc =3D kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
-+		       GFP_KERNEL);
-+	if (IS_ERR(desc)) {
-+		rc =3D PTR_ERR(desc);
-+		goto out;
-+	}
-+
-+	desc->tfm =3D shash;
-+
-+	rc =3D crypto_shash_init(desc);
-+	if (rc < 0)
-+		goto out2;
-+
-+	rc =3D crypto_shash_update(desc, (const u8 *)ns, sizeof(*ns));
-+	if (rc < 0)
-+		goto out2;
-+
-+	rc =3D crypto_shash_update(desc, (const u8 *)name, size);
-+	if (rc < 0)
-+		goto out2;
-+
-+	rc =3D crypto_shash_final(desc, hash);
-+	if (rc < 0)
-+		goto out2;
-+
-+	memcpy(uuid->b, hash, UUID_SIZE);
-+
-+	/* Tag for version 5 */
-+	uuid->b[6] =3D (hash[6] & 0x0F) | 0x50;
-+	uuid->b[8] =3D (hash[8] & 0x3F) | 0x80;
-+
-+out2:
-+	kfree(desc);
-+
-+out:
-+	crypto_free_shash(shash);
-+	return rc;
-+}
-+
-+int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
-+				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
-+{
-+	const char *application_id =3D NULL;
-+	gid_t ns_grp =3D (gid_t)-1;
-+	kgid_t grp =3D INVALID_GID;
-+	char *name =3D NULL;
-+	int rc;
-+
-+	if (connection_method =3D=3D TEE_IOCTL_LOGIN_PUBLIC) {
-+		/* Nil UUID to be passed to TEE environment */
-+		uuid_copy(uuid, &uuid_null);
-+		return 0;
-+	}
-+
-+	/*
-+	 * In Linux environment client UUID is based on UUIDv5.
-+	 *
-+	 * Determine client UUID with following semantics for 'name':
-+	 *
-+	 * For TEEC_LOGIN_USER:
-+	 * uid=3D<uid>
-+	 *
-+	 * For TEEC_LOGIN_GROUP:
-+	 * gid=3D<gid>
-+	 *
-+	 */
-+
-+	name =3D kzalloc(TEE_UUID_NS_NAME_SIZE, GFP_KERNEL);
-+	if (!name)
-+		return -ENOMEM;
-+
-+	switch (connection_method) {
-+	case TEE_IOCTL_LOGIN_USER:
-+		scnprintf(name, TEE_UUID_NS_NAME_SIZE, "uid=3D%x",
-+			  current_euid().val);
-+		break;
-+
-+	case TEE_IOCTL_LOGIN_GROUP:
-+		memcpy(&ns_grp, connection_data, sizeof(gid_t));
-+		grp =3D make_kgid(current_user_ns(), ns_grp);
-+		if (!gid_valid(grp) || !in_egroup_p(grp)) {
-+			rc =3D -EPERM;
-+			goto out;
-+		}
-+
-+		scnprintf(name, TEE_UUID_NS_NAME_SIZE, "gid=3D%x", grp.val);
-+		break;
-+
-+	default:
-+		rc =3D -EINVAL;
-+		goto out;
-+	}
-+
-+	rc =3D uuid_v5(uuid, &tee_client_uuid_ns, name, strlen(name));
-+out:
-+	kfree(name);
-+
-+	return rc;
-+}
-+EXPORT_SYMBOL_GPL(tee_session_calc_client_uuid);
-+
- static int tee_ioctl_version(struct tee_context *ctx,
- 			     struct tee_ioctl_version_data __user *uvers)
- {
-diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
-index 7a03f68fb982..545a57f61a5e 100644
---- a/include/linux/tee_drv.h
-+++ b/include/linux/tee_drv.h
-@@ -166,6 +166,22 @@ int tee_device_register(struct tee_device *teedev);
-  */
- void tee_device_unregister(struct tee_device *teedev);
-=20
-+/**
-+ * tee_session_calc_client_uuid() - Calculates client UUID for session
-+ * @uuid:		Resulting UUID
-+ * @connection_method:	Connection method for session (TEE_IOCTL_LOGIN_*)
-+ * @connectuon_data:	Connection data for opening session
-+ *
-+ * Based on connection method calculates UUIDv5 based client UUID.
-+ *
-+ * For group based logins verifies that calling process has specified
-+ * credentials.
-+ *
-+ * @return < 0 on failure
-+ */
-+int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
-+				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
-+
- /**
-  * struct tee_shm - shared memory object
-  * @teedev:	device used to allocate the object
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0011=
-tee-optee-Add-support-for-session-login-client-UUID-.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0011-tee-optee-Add-support-for=
-session-login-client-UUID-.patch
deleted file mode 100644
index 65d4311..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0011-tee-op=
tee-Add-support-for-session-login-client-UUID-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Backport [https://github.com/linaro-swg/linux/commit/c5b4=
312bea5d5e5e3d4f0af640e2ef8a1c1bb167#diff-2d83bca4adf0468bdb51b155a5df495e0=
226f7971f4150cfffbf043fe3b5a279]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From c6c4046d8fcd34a4b8da9d844ce592951780ba8c Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
- <vesa.jaaskelainen@vaisala.com>
-Date: Wed, 22 Apr 2020 15:30:39 +0300
-Subject: [PATCH] tee: optee: Add support for session login client UUID
- generation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Adds support for client UUID generation for OP-TEE. For group based sessio=
n
-logins membership is verified.
-
-Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
----
- drivers/tee/optee/call.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index cf2367ba08d6..dbed3f480dc0 100644
---- a/drivers/tee/optee/call.c
-+++ b/drivers/tee/optee/call.c
-@@ -233,9 +233,13 @@ int optee_open_session(struct tee_context *ctx,
- 	msg_arg->params[1].attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT |
- 				  OPTEE_MSG_ATTR_META;
- 	memcpy(&msg_arg->params[0].u.value, arg->uuid, sizeof(arg->uuid));
--	memcpy(&msg_arg->params[1].u.value, arg->uuid, sizeof(arg->clnt_uuid));
- 	msg_arg->params[1].u.value.c =3D arg->clnt_login;
-=20
-+	rc =3D tee_session_calc_client_uuid((uuid_t *)&msg_arg->params[1].u.valu=
e,
-+					  arg->clnt_login, arg->clnt_uuid);
-+	if (rc)
-+		goto out;
-+
- 	rc =3D optee_to_msg_param(msg_arg->params + 2, arg->num_params, param);
- 	if (rc)
- 		goto out;
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0012=
-driver-optee-Support-for-ffa-transport.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.4/tc0/0012-driver-optee-Support-for-ffa-transport.=
patch
deleted file mode 100644
index 40d4ffe..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0012-driver=
-optee-Support-for-ffa-transport.patch
+++ /dev/null
@@ -1,3150 +0,0 @@
-Upstream-Status: Pending [https://git.kernel.org/pub/scm/linux/kernel/git/=
sudeep.holla/linux.git/commit/?h=3Dffa_rel_proto&id=3D8a0acded67268b7110c69=
ed5425c56d881716d78]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 2e12bf893c180cb1444ca20148983d1c45431c71 Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Tue, 30 Oct 2018 21:12:11 +0100
-Subject: [PATCH] driver: optee: Support for ffa transport
-
-FF-A transport support for optee driver. Based on ffa_rel_proto at
-https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/log=
/?h=3Dffa_rel_proto
-
-Squashed in:
-    tee: remove linked list of struct tee_shm
-
-    Removes list_shm from struct tee_context since the linked list isn't u=
sed
-    any longer.
-
-    tee: remove unused tee_shm_priv_alloc()
-
-    tee_shm_priv_alloc() isn't useful in the current state and it's also n=
ot
-    not used so remove it.
-
-    tee: don't assign shm id for private shms
-
-    Private shared memory object must not be referenced from user space. T=
o
-    guarantee that don't assign an id to keep the shared memory driver
-    private.
-
-    tee: remove redundant teedev in struct tee_shm
-
-    Since the ctx element in struct tee_shm always is valid has the teedev
-    element become redundant so remove it.
-
-    tee: add sec_world_id to struct tee_shm
-
-    Adds sec_world_id to struct tee_shm which describes a shared memory
-    object. sec_world_id can be used by a driver to store an id assigned b=
y
-    secure world.
-
-    tee: tee_shm_op_mmap(): use TEE_SHM_USER_MAPPED
-
-    tee_shm_op_mmap() uses the TEE_SHM_USER_MAPPED flag instead of the
-    TEE_SHM_REGISTER flag to tell if a shared memory object is originating
-    from registered user space memory.
-
-    Set -Og flags for the OPTEE driver compilation.
-
-    optee: simplify optee_release()
-
-    Simplifies optee_release() with a new helper function,
-    optee_close_session_helper() which has been factored out from
-    optee_close_session().
-
-    A separate optee_release_supp() is added for the supplicant device.
-
-    tee: optee: sync optee_msg.h and optee_rpc_cmd.h
-
-    Updates to latest optee_msg.h and optee_rpc_cmd.h. There's no changes =
in
-    the ABI. Only some clarifications and a complete specification of RPC
-    requests where the latter is now in a separate file, optee_rpc_cmd.h.
-
-    Most of the RPC requests are not served by the OP-TEE driver instead
-    they are forwarded as opaque requests to tee-supplicant.
-
-    tee: export tee_shm_alloc()
-
-    Export tee_shm_alloc() using EXPORT_SYMBOL_GPL(). Needed by
-    optee_rng_init() and other drivers complied as a module and using OP-T=
EE
-    as a service.
-
-    optee: add spci support
-
-    Adds support for using SPCI as transport to the OP-TEE driver.
-
-    tee: optee: introduce SPCI specific OPTEE_MSG memref
-
-    Introduces struct optee_msg_param_smem which carries all information
-    needed when OP-TEE is calling SPCI_MEM_RETRIEVE_REQ to get the shared
-    memory reference mapped by the hypervisor in S-EL2. Register usage is
-    also updated to include the information needed.
-
-    This isn't strictly needed without a hypervisor in S-EL2 and OP-TEE
-    itself has the SPMC part. However, this is a configuration which
-    shouldn't concern normal world.
-
-    tee: optee: Use PARTITION_INFO_GET to get SP ID.
-
-    Instead of using a hardcoded partition ID for OPTEE, use the
-    SPCI_PARTITION_INFO_GET ABI to find the partition ID corresponding to
-    the OPTEE UUID.
-
-    tee: optee: Update OPTEE for mem_share SPCI
-
-    Update OPTEE to pass a scatterlist in the mem_share interface.
-
-    tee: Adapt OPTEE to new SPCI mem_share interface
-
-    optee: test_spci: Update optee, spci test driver [optee bits]
-
-    Enable optee and spci test drivesr to pass a scatterlist* and a nents
-    parameter in mem_share.
-
-    arm_spci: refactor mem_share implementation for EAC [optee bits]
-
-    arm_ffa: optee: Swap spci/SPCI for ffa/FFA. [optee bits]
-
-    arm_ffa: rename 1st member of arm_smcccv1_2_return [optee bits]
-
-    The smcccv1_2_return.func is renamed to arg0.
-
-    tee: add sec_world_id to struct tee_shm
-
-    Change the type of sec_world_id member of struct tee_shm to u64 to be
-    able to store the 64-bit Global Handle defined in FF-A.
-
-    optee: updated for FF-A 1.0
-
-    With FF-A 1.0 the ABI to secure world has changed compared to SPCI
-    beta1.
-
-    The globally unique handle to identify a shared memory object is now 6=
4
-    bits wide instead of previous 32. The IDR in struct optee_ffa is
-    replaced with a struct rhashtable instead in order to support 64-bit
-    keys.
-
-    Register usage in the FF-A function has changed compared to SPCI beta1
-    so the OP-TEE ABI is updated accordingly. The global handle, aka cooki=
e,
-    is now requires 2 registers.
-
-    struct optee_msg_param_smem is updated to be able to carry a 64-bit
-    global handle while maintaining the same size of the struct. Due to th=
is
-    the "page_count" field is dropped.
-
-    optee: Update SMCC field name
-
-    optee: Update FFA_VERSION from 0.9 to 1.0
-
-    optee/call.c: Update SPCI reference to FFA
-
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Marc Bonnici <marc.bonnici@arm.com>
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- drivers/tee/Makefile              |   1 +
- drivers/tee/optee/Makefile        |   1 +
- drivers/tee/optee/call.c          | 318 ++++++++++---
- drivers/tee/optee/core.c          | 735 +++++++++++++++++++++++++-----
- drivers/tee/optee/optee_ffa.h     | 201 ++++++++
- drivers/tee/optee/optee_msg.h     | 167 ++-----
- drivers/tee/optee/optee_private.h |  61 ++-
- drivers/tee/optee/optee_rpc_cmd.h | 333 ++++++++++++++
- drivers/tee/optee/rpc.c           | 147 +++++-
- drivers/tee/optee/shm_pool.c      |  50 ++
- drivers/tee/optee/shm_pool.h      |   1 +
- drivers/tee/tee_core.c            |   1 -
- drivers/tee/tee_shm.c             |  85 +---
- include/linux/tee_drv.h           |  26 +-
- 14 files changed, 1710 insertions(+), 417 deletions(-)
- create mode 100644 drivers/tee/optee/optee_ffa.h
- create mode 100644 drivers/tee/optee/optee_rpc_cmd.h
-
-diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
-index 21f51fd88b07..c4fe9f0d3bf8 100644
---- a/drivers/tee/Makefile
-+++ b/drivers/tee/Makefile
-@@ -4,3 +4,4 @@ tee-objs +=3D tee_core.o
- tee-objs +=3D tee_shm.o
- tee-objs +=3D tee_shm_pool.o
- obj-$(CONFIG_OPTEE) +=3D optee/
-+ccflags-y +=3D -Og
-diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
-index 56263ae3b1d7..57371dc91bba 100644
---- a/drivers/tee/optee/Makefile
-+++ b/drivers/tee/optee/Makefile
-@@ -6,3 +6,4 @@ optee-objs +=3D rpc.o
- optee-objs +=3D supp.o
- optee-objs +=3D shm_pool.o
- optee-objs +=3D device.o
-+ccflags-y +=3D -Og
-diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index dbed3f480dc0..ac89ab42a43f 100644
---- a/drivers/tee/optee/call.c
-+++ b/drivers/tee/optee/call.c
-@@ -3,16 +3,20 @@
-  * Copyright (c) 2015, Linaro Limited
-  */
- #include <linux/arm-smccc.h>
-+#include <linux/arm-smcccv1_2.h>
-+#include <linux/arm_ffa.h>
- #include <linux/device.h>
- #include <linux/err.h>
- #include <linux/errno.h>
- #include <linux/mm.h>
-+#include <linux/scatterlist.h>
- #include <linux/slab.h>
- #include <linux/tee_drv.h>
- #include <linux/types.h>
- #include <linux/uaccess.h>
- #include "optee_private.h"
- #include "optee_smc.h"
-+#include "optee_ffa.h"
-=20
- struct optee_call_waiter {
- 	struct list_head list_node;
-@@ -122,13 +126,18 @@ static struct optee_session *find_session(struct opt=
ee_context_data *ctxdata,
-  *
-  * Returns return code from secure world, 0 is OK
-  */
--u32 optee_do_call_with_arg(struct tee_context *ctx, phys_addr_t parg)
-+int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg)
- {
- 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
--	struct optee_call_waiter w;
-+	struct optee_call_waiter w =3D { };
- 	struct optee_rpc_param param =3D { };
- 	struct optee_call_ctx call_ctx =3D { };
--	u32 ret;
-+	phys_addr_t parg =3D 0;
-+	int rc =3D 0;
-+
-+	rc =3D tee_shm_get_pa(arg, 0, &parg);
-+	if (rc)
-+		return rc;
-=20
- 	param.a0 =3D OPTEE_SMC_CALL_WITH_ARG;
- 	reg_pair_from_64(&param.a1, &param.a2, parg);
-@@ -155,7 +164,7 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, ph=
ys_addr_t parg)
- 			param.a3 =3D res.a3;
- 			optee_handle_rpc(ctx, &param, &call_ctx);
- 		} else {
--			ret =3D res.a0;
-+			rc =3D res.a0;
- 			break;
- 		}
- 	}
-@@ -167,16 +176,15 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, =
phys_addr_t parg)
- 	 */
- 	optee_cq_wait_final(&optee->call_queue, &w);
-=20
--	return ret;
-+	return rc;
- }
-=20
- static struct tee_shm *get_msg_arg(struct tee_context *ctx, size_t num_pa=
rams,
--				   struct optee_msg_arg **msg_arg,
--				   phys_addr_t *msg_parg)
-+				   struct optee_msg_arg **msg_arg)
- {
--	int rc;
--	struct tee_shm *shm;
--	struct optee_msg_arg *ma;
-+	int rc =3D 0;
-+	struct tee_shm *shm =3D NULL;
-+	struct optee_msg_arg *ma =3D NULL;
-=20
- 	shm =3D tee_shm_alloc(ctx, OPTEE_MSG_GET_ARG_SIZE(num_params),
- 			    TEE_SHM_MAPPED);
-@@ -189,10 +197,6 @@ static struct tee_shm *get_msg_arg(struct tee_context=
 *ctx, size_t num_params,
- 		goto out;
- 	}
-=20
--	rc =3D tee_shm_get_pa(shm, 0, msg_parg);
--	if (rc)
--		goto out;
--
- 	memset(ma, 0, OPTEE_MSG_GET_ARG_SIZE(num_params));
- 	ma->num_params =3D num_params;
- 	*msg_arg =3D ma;
-@@ -209,15 +213,15 @@ int optee_open_session(struct tee_context *ctx,
- 		       struct tee_ioctl_open_session_arg *arg,
- 		       struct tee_param *param)
- {
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
- 	struct optee_context_data *ctxdata =3D ctx->data;
--	int rc;
--	struct tee_shm *shm;
--	struct optee_msg_arg *msg_arg;
--	phys_addr_t msg_parg;
-+	struct optee_msg_arg *msg_arg =3D NULL;
- 	struct optee_session *sess =3D NULL;
-+	struct tee_shm *shm =3D NULL;
-+	int rc =3D 0;
-=20
- 	/* +2 for the meta parameters added below */
--	shm =3D get_msg_arg(ctx, arg->num_params + 2, &msg_arg, &msg_parg);
-+	shm =3D get_msg_arg(ctx, arg->num_params + 2, &msg_arg);
- 	if (IS_ERR(shm))
- 		return PTR_ERR(shm);
-=20
-@@ -240,7 +244,8 @@ int optee_open_session(struct tee_context *ctx,
- 	if (rc)
- 		goto out;
-=20
--	rc =3D optee_to_msg_param(msg_arg->params + 2, arg->num_params, param);
-+	rc =3D optee->ops->to_msg_param(optee, msg_arg->params + 2,
-+				      arg->num_params, param);
- 	if (rc)
- 		goto out;
-=20
-@@ -250,7 +255,7 @@ int optee_open_session(struct tee_context *ctx,
- 		goto out;
- 	}
-=20
--	if (optee_do_call_with_arg(ctx, msg_parg)) {
-+	if (optee->ops->do_call_with_arg(ctx, shm)) {
- 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
- 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
- 	}
-@@ -265,7 +270,8 @@ int optee_open_session(struct tee_context *ctx,
- 		kfree(sess);
- 	}
-=20
--	if (optee_from_msg_param(param, arg->num_params, msg_arg->params + 2)) {
-+	if (optee->ops->from_msg_param(optee, param, arg->num_params,
-+				       msg_arg->params + 2)) {
- 		arg->ret =3D TEEC_ERROR_COMMUNICATION;
- 		arg->ret_origin =3D TEEC_ORIGIN_COMMS;
- 		/* Close session again to avoid leakage */
-@@ -281,12 +287,28 @@ int optee_open_session(struct tee_context *ctx,
- 	return rc;
- }
-=20
--int optee_close_session(struct tee_context *ctx, u32 session)
-+int optee_close_session_helper(struct tee_context *ctx, u32 session)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	struct optee_msg_arg *msg_arg =3D NULL;
-+	struct tee_shm *shm =3D NULL;
-+
-+	shm =3D get_msg_arg(ctx, 0, &msg_arg);
-+	if (IS_ERR(shm))
-+		return PTR_ERR(shm);
-+
-+	msg_arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
-+	msg_arg->session =3D session;
-+	optee->ops->do_call_with_arg(ctx, shm);
-+
-+	tee_shm_free(shm);
-+
-+	return 0;
-+}
-+
-+static int remove_session(struct tee_context *ctx, u32 session)
- {
- 	struct optee_context_data *ctxdata =3D ctx->data;
--	struct tee_shm *shm;
--	struct optee_msg_arg *msg_arg;
--	phys_addr_t msg_parg;
- 	struct optee_session *sess;
-=20
- 	/* Check that the session is valid and remove it from the list */
-@@ -299,27 +321,28 @@ int optee_close_session(struct tee_context *ctx, u32=
 session)
- 		return -EINVAL;
- 	kfree(sess);
-=20
--	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
--	if (IS_ERR(shm))
--		return PTR_ERR(shm);
-+	return 0;
-+}
-=20
--	msg_arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
--	msg_arg->session =3D session;
--	optee_do_call_with_arg(ctx, msg_parg);
-+int optee_close_session(struct tee_context *ctx, u32 session)
-+{
-+	int rc =3D remove_session(ctx, session);
-=20
--	tee_shm_free(shm);
--	return 0;
-+	if (rc)
-+		return rc;
-+
-+	return optee_close_session_helper(ctx, session);
- }
-=20
- int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_ar=
g *arg,
- 		      struct tee_param *param)
- {
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
- 	struct optee_context_data *ctxdata =3D ctx->data;
--	struct tee_shm *shm;
--	struct optee_msg_arg *msg_arg;
--	phys_addr_t msg_parg;
--	struct optee_session *sess;
--	int rc;
-+	struct optee_msg_arg *msg_arg =3D NULL;
-+	struct optee_session *sess =3D NULL;
-+	struct tee_shm *shm =3D NULL;
-+	int rc =3D 0;
-=20
- 	/* Check that the session is valid */
- 	mutex_lock(&ctxdata->mutex);
-@@ -328,7 +351,7 @@ int optee_invoke_func(struct tee_context *ctx, struct =
tee_ioctl_invoke_arg *arg,
- 	if (!sess)
- 		return -EINVAL;
-=20
--	shm =3D get_msg_arg(ctx, arg->num_params, &msg_arg, &msg_parg);
-+	shm =3D get_msg_arg(ctx, arg->num_params, &msg_arg);
- 	if (IS_ERR(shm))
- 		return PTR_ERR(shm);
- 	msg_arg->cmd =3D OPTEE_MSG_CMD_INVOKE_COMMAND;
-@@ -336,16 +359,18 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
- 	msg_arg->session =3D arg->session;
- 	msg_arg->cancel_id =3D arg->cancel_id;
-=20
--	rc =3D optee_to_msg_param(msg_arg->params, arg->num_params, param);
-+	rc =3D optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
-+				      param);
- 	if (rc)
- 		goto out;
-=20
--	if (optee_do_call_with_arg(ctx, msg_parg)) {
-+	if (optee->ops->do_call_with_arg(ctx, shm)) {
- 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
- 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
- 	}
-=20
--	if (optee_from_msg_param(param, arg->num_params, msg_arg->params)) {
-+	if (optee->ops->from_msg_param(optee, param, arg->num_params,
-+				       msg_arg->params)) {
- 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
- 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
- 	}
-@@ -359,11 +384,11 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
-=20
- int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session)
- {
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
- 	struct optee_context_data *ctxdata =3D ctx->data;
--	struct tee_shm *shm;
--	struct optee_msg_arg *msg_arg;
--	phys_addr_t msg_parg;
--	struct optee_session *sess;
-+	struct optee_msg_arg *msg_arg =3D NULL;
-+	struct optee_session *sess =3D NULL;
-+	struct tee_shm *shm =3D NULL;
-=20
- 	/* Check that the session is valid */
- 	mutex_lock(&ctxdata->mutex);
-@@ -372,14 +397,14 @@ int optee_cancel_req(struct tee_context *ctx, u32 ca=
ncel_id, u32 session)
- 	if (!sess)
- 		return -EINVAL;
-=20
--	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
-+	shm =3D get_msg_arg(ctx, 0, &msg_arg);
- 	if (IS_ERR(shm))
- 		return PTR_ERR(shm);
-=20
- 	msg_arg->cmd =3D OPTEE_MSG_CMD_CANCEL;
- 	msg_arg->session =3D session;
- 	msg_arg->cancel_id =3D cancel_id;
--	optee_do_call_with_arg(ctx, msg_parg);
-+	optee->ops->do_call_with_arg(ctx, shm);
-=20
- 	tee_shm_free(shm);
- 	return 0;
-@@ -442,6 +467,16 @@ void optee_disable_shm_cache(struct optee *optee)
- 	optee_cq_wait_final(&optee->call_queue, &w);
- }
-=20
-+/**
-+ * optee_ffa_disable_shm_cache() - Disables caching of some shared memory
-+ *                                  allocation in OP-TEE
-+ * @optee:	main service struct
-+ */
-+void optee_ffa_disable_shm_cache(struct optee *optee)
-+{
-+	BUG();
-+}
-+
- #define PAGELIST_ENTRIES_PER_PAGE				\
- 	((OPTEE_MSG_NONCONTIG_PAGE_SIZE / sizeof(u64)) - 1)
-=20
-@@ -577,11 +612,11 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
- 		       struct page **pages, size_t num_pages,
- 		       unsigned long start)
- {
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	struct optee_msg_arg *msg_arg =3D NULL;
- 	struct tee_shm *shm_arg =3D NULL;
--	struct optee_msg_arg *msg_arg;
--	u64 *pages_list;
--	phys_addr_t msg_parg;
--	int rc;
-+	u64 *pages_list =3D NULL;
-+	int rc =3D 0;
-=20
- 	if (!num_pages)
- 		return -EINVAL;
-@@ -594,7 +629,7 @@ int optee_shm_register(struct tee_context *ctx, struct=
 tee_shm *shm,
- 	if (!pages_list)
- 		return -ENOMEM;
-=20
--	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg, &msg_parg);
-+	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
- 	if (IS_ERR(shm_arg)) {
- 		rc =3D PTR_ERR(shm_arg);
- 		goto out;
-@@ -615,7 +650,7 @@ int optee_shm_register(struct tee_context *ctx, struct=
 tee_shm *shm,
- 	msg_arg->params->u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
- 	  (tee_shm_get_page_offset(shm) & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
-=20
--	if (optee_do_call_with_arg(ctx, msg_parg) ||
-+	if (optee->ops->do_call_with_arg(ctx, shm) ||
- 	    msg_arg->ret !=3D TEEC_SUCCESS)
- 		rc =3D -EINVAL;
-=20
-@@ -627,12 +662,12 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
-=20
- int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
- {
--	struct tee_shm *shm_arg;
--	struct optee_msg_arg *msg_arg;
--	phys_addr_t msg_parg;
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	struct optee_msg_arg *msg_arg =3D NULL;
-+	struct tee_shm *shm_arg =3D NULL;
- 	int rc =3D 0;
-=20
--	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg, &msg_parg);
-+	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
- 	if (IS_ERR(shm_arg))
- 		return PTR_ERR(shm_arg);
-=20
-@@ -641,7 +676,7 @@ int optee_shm_unregister(struct tee_context *ctx, stru=
ct tee_shm *shm)
- 	msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
- 	msg_arg->params[0].u.rmem.shm_ref =3D (unsigned long)shm;
-=20
--	if (optee_do_call_with_arg(ctx, msg_parg) ||
-+	if (optee->ops->do_call_with_arg(ctx, shm) ||
- 	    msg_arg->ret !=3D TEEC_SUCCESS)
- 		rc =3D -EINVAL;
- 	tee_shm_free(shm_arg);
-@@ -663,3 +698,166 @@ int optee_shm_unregister_supp(struct tee_context *ct=
x, struct tee_shm *shm)
- {
- 	return 0;
- }
-+
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static int optee_ffa_yielding_call(struct tee_context *ctx, u32 w3, u32 w=
4,
-+				    u32 w5)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	struct arm_smcccv1_2_return ret =3D { };
-+	const u32 dst =3D optee->ffa.dst;
-+	struct optee_call_waiter w;
-+	u32 w6 =3D 0;
-+	u32 w7 =3D 0;
-+	int rc =3D 0;
-+
-+	/* Initialize waiter */
-+	optee_cq_wait_init(&optee->call_queue, &w);
-+	while (true) {
-+		ret =3D optee->ffa.ops->sync_msg_send(dst, w3, w4, w5, w6, w7);
-+
-+		if (ret.arg0) {
-+			pr_err("ret.arg0 %d\n", (int)ret.arg0);
-+			rc =3D -EIO;
-+			goto done;
-+		}
-+
-+		switch ((int)ret.arg3) {
-+		case FFA_SUCCESS:
-+			break;
-+		case FFA_BUSY:
-+			if (w3 =3D=3D OPTEE_FFA_YIELDING_CALL_RESUME) {
-+				pr_err("err OPTEE_FFA_YIELDING_CALL_RESUME\n");
-+				rc =3D -EIO;
-+				goto done;
-+			}
-+
-+			/*
-+			 * Out of threads in secure world, wait for a thread
-+			 * become available.
-+			 */
-+			optee_cq_wait_for_completion(&optee->call_queue, &w);
-+			continue;
-+		default:
-+			pr_err("ret.arg3 0x%llx\n", (u64)ret.arg3);
-+			rc =3D -EIO;
-+			goto done;
-+		}
-+
-+		if (ret.arg4 =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_DONE)
-+			goto done;
-+
-+		might_sleep();
-+		w4 =3D ret.arg4;
-+		w5 =3D ret.arg5;
-+		w6 =3D ret.arg6;
-+		optee_handle_ffa_rpc(ctx, &w4, &w5, &w6);
-+		w3 =3D OPTEE_FFA_YIELDING_CALL_RESUME;
-+		w7 =3D ret.arg7;
-+	}
-+done:
-+
-+	/*
-+	 * We're done with our thread in secure world, if there's any
-+	 * thread waiters wake up one.
-+	 */
-+	optee_cq_wait_final(&optee->call_queue, &w);
-+
-+	return rc;
-+}
-+
-+int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm *s=
hm)
-+{
-+	if (shm->offset)
-+		return -EINVAL;
-+	return optee_ffa_yielding_call(ctx, OPTEE_FFA_YIELDING_CALL_WITH_ARG,
-+				       shm->sec_world_id,
-+				       shm->sec_world_id >> 32);
-+}
-+
-+int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
-+			    struct page **pages, size_t num_pages,
-+			    unsigned long start)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	u64 global_handle =3D 0;
-+	u32 rc =3D 0;
-+	struct sg_table sgt;
-+	struct ffa_mem_region_attributes mem_attr =3D {
-+		.receiver =3D optee->ffa.dst,
-+		.attrs =3D FFA_MEM_RW,
-+	};
-+
-+	rc =3D check_mem_type(start, num_pages);
-+	if (rc)
-+		return rc;
-+
-+	sg_alloc_table_from_pages(&sgt, pages,
-+			      num_pages, 0,
-+			      num_pages * 4096, GFP_KERNEL);
-+
-+	rc =3D optee->ffa.ops->mem_share(0, 0, &mem_attr, 1, sgt.sgl, sgt.nents,
-+		&global_handle, true);
-+	if (rc) {
-+		if (rc =3D=3D FFA_NO_MEMORY)
-+			return -ENOMEM;
-+		return -EINVAL;
-+	}
-+
-+	rc =3D optee_shm_add_ffa_handle(optee, shm, global_handle);
-+	if (rc) {
-+		optee->ffa.ops->mem_reclaim(global_handle, 0);
-+		return rc;
-+	}
-+
-+	shm->sec_world_id =3D global_handle;
-+
-+	return 0;
-+}
-+
-+int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *shm=
)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	u64 global_handle =3D shm->sec_world_id;
-+	int rc =3D 0;
-+
-+	optee_shm_rem_ffa_handle(optee, global_handle);
-+	shm->sec_world_id =3D 0;
-+
-+	rc =3D optee_ffa_yielding_call(ctx,
-+				     OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM,
-+				     global_handle, global_handle >> 32);
-+	if (rc)
-+		pr_err("OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM id 0x%llx rc %d\n",
-+		       global_handle, rc);
-+
-+	rc =3D optee->ffa.ops->mem_reclaim(global_handle, 0);
-+	if (rc)
-+		pr_err("mem_reclain: %d", rc);
-+
-+	return rc;
-+}
-+
-+int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
-+				   struct tee_shm *shm)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	int rc =3D 0;
-+
-+	/*
-+	 * We're skipping the OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM call
-+	 * since this is OP-TEE freeing via RPC so it has already retired
-+	 * this ID.
-+	 */
-+
-+	rc =3D optee->ffa.ops->mem_reclaim(shm->sec_world_id, 0);
-+	if (rc)
-+		pr_err("mem_reclain: %d", rc);
-+
-+	optee_shm_rem_ffa_handle(optee, shm->sec_world_id);
-+
-+	shm->sec_world_id =3D 0;
-+
-+	return rc;
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
-index b830e0a87fba..4178ae7f914a 100644
---- a/drivers/tee/optee/core.c
-+++ b/drivers/tee/optee/core.c
-@@ -6,6 +6,8 @@
- #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-=20
- #include <linux/arm-smccc.h>
-+#include <linux/arm-smcccv1_2.h>
-+#include <linux/arm_ffa.h>
- #include <linux/errno.h>
- #include <linux/io.h>
- #include <linux/module.h>
-@@ -19,12 +21,157 @@
- #include <linux/uaccess.h>
- #include "optee_private.h"
- #include "optee_smc.h"
-+#include "optee_ffa.h"
- #include "shm_pool.h"
-=20
- #define DRIVER_NAME "optee"
-+#define SUPPORTED_OPTEE_PARTITIONS 1
-=20
- #define OPTEE_SHM_NUM_PRIV_PAGES	CONFIG_OPTEE_SHM_NUM_PRIV_PAGES
-=20
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+struct shm_rhash {
-+	struct tee_shm *shm;
-+	u64 global_id;
-+	struct rhash_head linkage;
-+};
-+
-+static void rh_free_fn(void *ptr, void *arg)
-+{
-+	kfree(ptr);
-+}
-+
-+static const struct rhashtable_params shm_rhash_params =3D {
-+	.head_offset =3D offsetof(struct shm_rhash, linkage),
-+	.key_len     =3D sizeof(u64),
-+	.key_offset  =3D offsetof(struct shm_rhash, global_id),
-+	.automatic_shrinking =3D true,
-+};
-+
-+struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 global=
_id)
-+{
-+	struct shm_rhash *r =3D NULL;
-+	struct tee_shm *shm =3D NULL;
-+
-+	mutex_lock(&optee->ffa.mutex);
-+	r =3D rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
-+				   shm_rhash_params);
-+	if (r)
-+		shm =3D r->shm;
-+	mutex_unlock(&optee->ffa.mutex);
-+
-+	return shm;
-+}
-+
-+int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
-+			      u64 global_id)
-+{
-+	struct shm_rhash *r =3D NULL;
-+	int rc =3D 0;
-+
-+	r =3D kmalloc(sizeof(*r), GFP_KERNEL);
-+	if (!r)
-+		return -ENOMEM;
-+	r->shm =3D shm;
-+	r->global_id =3D global_id;
-+
-+	mutex_lock(&optee->ffa.mutex);
-+	rc =3D rhashtable_lookup_insert_fast(&optee->ffa.global_ids, &r->linkage=
,
-+					   shm_rhash_params);
-+	mutex_unlock(&optee->ffa.mutex);
-+
-+	if (rc)
-+		kfree(r);
-+
-+	return rc;
-+}
-+
-+int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
-+{
-+	struct shm_rhash *r =3D NULL;
-+	int rc =3D -ENOENT;
-+
-+	mutex_lock(&optee->ffa.mutex);
-+	r =3D rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
-+				   shm_rhash_params);
-+	if (r) {
-+		rc =3D rhashtable_remove_fast(&optee->ffa.global_ids,
-+					    &r->linkage, shm_rhash_params);
-+		if (!rc)
-+			kfree(r);
-+	}
-+	mutex_unlock(&optee->ffa.mutex);
-+
-+	return rc;
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-+
-+static void from_msg_param_value(struct tee_param *p, u32 attr,
-+				 const struct optee_msg_param *mp)
-+{
-+	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
-+		  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
-+	p->u.value.a =3D mp->u.value.a;
-+	p->u.value.b =3D mp->u.value.b;
-+	p->u.value.c =3D mp->u.value.c;
-+}
-+
-+static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
-+				  const struct optee_msg_param *mp)
-+{
-+	struct tee_shm *shm =3D NULL;
-+	phys_addr_t pa =3D 0;
-+	int rc =3D 0;
-+
-+	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
-+		  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
-+	p->u.memref.size =3D mp->u.tmem.size;
-+	shm =3D (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
-+	if (!shm) {
-+		p->u.memref.shm_offs =3D 0;
-+		p->u.memref.shm =3D NULL;
-+		return 0;
-+	}
-+
-+	rc =3D tee_shm_get_pa(shm, 0, &pa);
-+	if (rc)
-+		return rc;
-+
-+	p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
-+	p->u.memref.shm =3D shm;
-+
-+	/* Check that the memref is covered by the shm object */
-+	if (p->u.memref.size) {
-+		size_t o =3D p->u.memref.shm_offs +
-+			   p->u.memref.size - 1;
-+
-+		rc =3D tee_shm_get_pa(shm, o, NULL);
-+		if (rc)
-+			return rc;
-+	}
-+
-+	return 0;
-+}
-+
-+static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
-+				   const struct optee_msg_param *mp)
-+{
-+	struct tee_shm *shm =3D NULL;
-+
-+	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
-+		  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
-+	p->u.memref.size =3D mp->u.rmem.size;
-+	shm =3D (struct tee_shm *)(unsigned long) mp->u.rmem.shm_ref;
-+
-+	if (shm) {
-+		p->u.memref.shm_offs =3D mp->u.rmem.offs;
-+		p->u.memref.shm =3D shm;
-+	} else {
-+		p->u.memref.shm_offs =3D 0;
-+		p->u.memref.shm =3D NULL;
-+	}
-+}
-+
- /**
-  * optee_from_msg_param() - convert from OPTEE_MSG parameters to
-  *			    struct tee_param
-@@ -33,13 +180,12 @@
-  * @msg_params:	OPTEE_MSG parameters
-  * Returns 0 on success or <0 on failure
-  */
--int optee_from_msg_param(struct tee_param *params, size_t num_params,
--			 const struct optee_msg_param *msg_params)
-+static int optee_from_msg_param(struct optee *optee, struct tee_param *pa=
rams,
-+				size_t num_params,
-+				const struct optee_msg_param *msg_params)
- {
--	int rc;
--	size_t n;
--	struct tee_shm *shm;
--	phys_addr_t pa;
-+	size_t n =3D 0;
-+	int rc =3D 0;
-=20
- 	for (n =3D 0; n < num_params; n++) {
- 		struct tee_param *p =3D params + n;
-@@ -54,58 +200,19 @@ int optee_from_msg_param(struct tee_param *params, si=
ze_t num_params,
- 		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
- 		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
- 		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
--			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
--				  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
--			p->u.value.a =3D mp->u.value.a;
--			p->u.value.b =3D mp->u.value.b;
--			p->u.value.c =3D mp->u.value.c;
-+			from_msg_param_value(p, attr, mp);
- 			break;
- 		case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
- 		case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
- 		case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
--			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
--				  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
--			p->u.memref.size =3D mp->u.tmem.size;
--			shm =3D (struct tee_shm *)(unsigned long)
--				mp->u.tmem.shm_ref;
--			if (!shm) {
--				p->u.memref.shm_offs =3D 0;
--				p->u.memref.shm =3D NULL;
--				break;
--			}
--			rc =3D tee_shm_get_pa(shm, 0, &pa);
-+			rc =3D from_msg_param_tmp_mem(p, attr, mp);
- 			if (rc)
- 				return rc;
--			p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
--			p->u.memref.shm =3D shm;
--
--			/* Check that the memref is covered by the shm object */
--			if (p->u.memref.size) {
--				size_t o =3D p->u.memref.shm_offs +
--					   p->u.memref.size - 1;
--
--				rc =3D tee_shm_get_pa(shm, o, NULL);
--				if (rc)
--					return rc;
--			}
- 			break;
- 		case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
- 		case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
- 		case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
--			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
--				  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
--			p->u.memref.size =3D mp->u.rmem.size;
--			shm =3D (struct tee_shm *)(unsigned long)
--				mp->u.rmem.shm_ref;
--
--			if (!shm) {
--				p->u.memref.shm_offs =3D 0;
--				p->u.memref.shm =3D NULL;
--				break;
--			}
--			p->u.memref.shm_offs =3D mp->u.rmem.offs;
--			p->u.memref.shm =3D shm;
--
-+			from_msg_param_reg_mem(p, attr, mp);
- 			break;
-=20
- 		default:
-@@ -115,11 +222,21 @@ int optee_from_msg_param(struct tee_param *params, s=
ize_t num_params,
- 	return 0;
- }
-=20
-+static void to_msg_param_value(struct optee_msg_param *mp,
-+			       const struct tee_param *p)
-+{
-+	mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
-+		   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
-+	mp->u.value.a =3D p->u.value.a;
-+	mp->u.value.b =3D p->u.value.b;
-+	mp->u.value.c =3D p->u.value.c;
-+}
-+
- static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
- 				const struct tee_param *p)
- {
--	int rc;
--	phys_addr_t pa;
-+	phys_addr_t pa =3D 0;
-+	int rc =3D 0;
-=20
- 	mp->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
- 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
-@@ -162,11 +279,12 @@ static int to_msg_param_reg_mem(struct optee_msg_par=
am *mp,
-  * @params:	subsystem itnernal parameter representation
-  * Returns 0 on success or <0 on failure
-  */
--int optee_to_msg_param(struct optee_msg_param *msg_params, size_t num_par=
ams,
--		       const struct tee_param *params)
-+static int optee_to_msg_param(struct optee *optee,
-+			      struct optee_msg_param *msg_params,
-+			      size_t num_params, const struct tee_param *params)
- {
--	int rc;
--	size_t n;
-+	size_t n =3D 0;
-+	int rc =3D 0;
-=20
- 	for (n =3D 0; n < num_params; n++) {
- 		const struct tee_param *p =3D params + n;
-@@ -180,11 +298,7 @@ int optee_to_msg_param(struct optee_msg_param *msg_pa=
rams, size_t num_params,
- 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
- 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
- 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
--			mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
--				   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
--			mp->u.value.a =3D p->u.value.a;
--			mp->u.value.b =3D p->u.value.b;
--			mp->u.value.c =3D p->u.value.c;
-+			to_msg_param_value(mp, p);
- 			break;
- 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
- 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
-@@ -203,6 +317,137 @@ int optee_to_msg_param(struct optee_msg_param *msg_p=
arams, size_t num_params,
- 	return 0;
- }
-=20
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param =
*p,
-+				    u32 attr, const struct optee_msg_param *mp)
-+{
-+	struct tee_shm *shm =3D NULL;
-+	u64 offs_high =3D 0;
-+	u64 offs_low =3D 0;
-+
-+	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
-+		  attr - OPTEE_MSG_ATTR_TYPE_SMEM_INPUT;
-+	p->u.memref.size =3D mp->u.smem.size;
-+	shm =3D optee_shm_from_ffa_handle(optee, mp->u.smem.global_id);
-+	p->u.memref.shm =3D shm;
-+	if (shm) {
-+		offs_low =3D mp->u.smem.offs_low;
-+		offs_high =3D mp->u.smem.offs_high;
-+	}
-+	p->u.memref.shm_offs =3D offs_low | offs_high << 32;
-+}
-+
-+/**
-+ * optee_ffa_from_msg_param() - convert from OPTEE_MSG parameters to
-+ *				 struct tee_param
-+ * @params:	subsystem internal parameter representation
-+ * @num_params:	number of elements in the parameter arrays
-+ * @msg_params:	OPTEE_MSG parameters
-+ * Returns 0 on success or <0 on failure
-+ */
-+static int optee_ffa_from_msg_param(struct optee *optee,
-+				     struct tee_param *params,
-+				     size_t num_params,
-+				     const struct optee_msg_param *msg_params)
-+{
-+	size_t n =3D 0;
-+
-+	for (n =3D 0; n < num_params; n++) {
-+		struct tee_param *p =3D params + n;
-+		const struct optee_msg_param *mp =3D msg_params + n;
-+		u32 attr =3D mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
-+
-+		switch (attr) {
-+		case OPTEE_MSG_ATTR_TYPE_NONE:
-+			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
-+			memset(&p->u, 0, sizeof(p->u));
-+			break;
-+		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
-+		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
-+		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
-+			from_msg_param_value(p, attr, mp);
-+			break;
-+		case OPTEE_MSG_ATTR_TYPE_SMEM_INPUT:
-+		case OPTEE_MSG_ATTR_TYPE_SMEM_OUTPUT:
-+		case OPTEE_MSG_ATTR_TYPE_SMEM_INOUT:
-+			from_msg_param_ffa_mem(optee, p, attr, mp);
-+			break;
-+		default:
-+			return -EINVAL;
-+		}
-+	}
-+	return 0;
-+}
-+
-+static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
-+				 const struct tee_param *p)
-+{
-+	struct tee_shm *shm =3D p->u.memref.shm;
-+
-+	mp->attr =3D OPTEE_MSG_ATTR_TYPE_SMEM_INPUT + p->attr -
-+		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
-+
-+	if (shm) {
-+		u64 shm_offs =3D p->u.memref.shm_offs;
-+
-+		mp->u.smem.internal_offs =3D shm->offset;
-+
-+		mp->u.smem.offs_low =3D shm_offs;
-+		mp->u.smem.offs_high =3D shm_offs >> 32;
-+		/* Check that the entire offset could be stored. */
-+		if (mp->u.smem.offs_high !=3D shm_offs >> 32)
-+			return -EINVAL;
-+
-+		mp->u.smem.global_id =3D shm->sec_world_id;
-+	} else {
-+		memset(&mp->u, 0, sizeof(mp->u));
-+	}
-+	mp->u.smem.size =3D p->u.memref.size;
-+	return 0;
-+}
-+
-+/**
-+ * optee_to_msg_param() - convert from struct tee_params to OPTEE_MSG par=
ameters
-+ * @msg_params:	OPTEE_MSG parameters
-+ * @num_params:	number of elements in the parameter arrays
-+ * @params:	subsystem itnernal parameter representation
-+ * Returns 0 on success or <0 on failure
-+ */
-+static int optee_ffa_to_msg_param(struct optee *optee,
-+				   struct optee_msg_param *msg_params,
-+				   size_t num_params,
-+				   const struct tee_param *params)
-+{
-+	size_t n;
-+
-+	for (n =3D 0; n < num_params; n++) {
-+		const struct tee_param *p =3D params + n;
-+		struct optee_msg_param *mp =3D msg_params + n;
-+
-+		switch (p->attr) {
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
-+			mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
-+			memset(&mp->u, 0, sizeof(mp->u));
-+			break;
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
-+			to_msg_param_value(mp, p);
-+			break;
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-+			if (to_msg_param_ffa_mem(mp, p))
-+				return -EINVAL;
-+			break;
-+		default:
-+			return -EINVAL;
-+		}
-+	}
-+	return 0;
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-+
- static void optee_get_version(struct tee_device *teedev,
- 			      struct tee_ioctl_version_data *vers)
- {
-@@ -218,6 +463,17 @@ static void optee_get_version(struct tee_device *teed=
ev,
- 	*vers =3D v;
- }
-=20
-+static void optee_ffa_get_version(struct tee_device *teedev,
-+				   struct tee_ioctl_version_data *vers)
-+{
-+	struct tee_ioctl_version_data v =3D {
-+		.impl_id =3D TEE_IMPL_ID_OPTEE,
-+		.impl_caps =3D TEE_OPTEE_CAP_TZ,
-+		.gen_caps =3D TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM,
-+	};
-+	*vers =3D v;
-+}
-+
- static int optee_open(struct tee_context *ctx)
- {
- 	struct optee_context_data *ctxdata;
-@@ -250,57 +506,41 @@ static int optee_open(struct tee_context *ctx)
- 	return 0;
- }
-=20
--static void optee_release(struct tee_context *ctx)
-+static void optee_release_helper(struct tee_context *ctx,
-+				 int (*close_session)(struct tee_context *ctx,
-+						      u32 session))
- {
- 	struct optee_context_data *ctxdata =3D ctx->data;
--	struct tee_device *teedev =3D ctx->teedev;
--	struct optee *optee =3D tee_get_drvdata(teedev);
--	struct tee_shm *shm;
--	struct optee_msg_arg *arg =3D NULL;
--	phys_addr_t parg;
- 	struct optee_session *sess;
- 	struct optee_session *sess_tmp;
-=20
- 	if (!ctxdata)
- 		return;
-=20
--	shm =3D tee_shm_alloc(ctx, sizeof(struct optee_msg_arg), TEE_SHM_MAPPED)=
;
--	if (!IS_ERR(shm)) {
--		arg =3D tee_shm_get_va(shm, 0);
--		/*
--		 * If va2pa fails for some reason, we can't call into
--		 * secure world, only free the memory. Secure OS will leak
--		 * sessions and finally refuse more sessions, but we will
--		 * at least let normal world reclaim its memory.
--		 */
--		if (!IS_ERR(arg))
--			if (tee_shm_va2pa(shm, arg, &parg))
--				arg =3D NULL; /* prevent usage of parg below */
--	}
--
- 	list_for_each_entry_safe(sess, sess_tmp, &ctxdata->sess_list,
- 				 list_node) {
- 		list_del(&sess->list_node);
--		if (!IS_ERR_OR_NULL(arg)) {
--			memset(arg, 0, sizeof(*arg));
--			arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
--			arg->session =3D sess->session_id;
--			optee_do_call_with_arg(ctx, parg);
--		}
-+		close_session(ctx, sess->session_id);
- 		kfree(sess);
- 	}
- 	kfree(ctxdata);
-+	ctx->data =3D NULL;
-+}
-=20
--	if (!IS_ERR(shm))
--		tee_shm_free(shm);
-+static void optee_release(struct tee_context *ctx)
-+{
-+	optee_release_helper(ctx, optee_close_session_helper);
-+}
-=20
--	ctx->data =3D NULL;
-+static void optee_release_supp(struct tee_context *ctx)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-=20
--	if (teedev =3D=3D optee->supp_teedev)
--		optee_supp_release(&optee->supp);
-+	optee_release_helper(ctx, optee_close_session_helper);
-+	optee_supp_release(&optee->supp);
- }
-=20
--static const struct tee_driver_ops optee_ops =3D {
-+static const struct tee_driver_ops optee_legacy_clnt_ops =3D {
- 	.get_version =3D optee_get_version,
- 	.open =3D optee_open,
- 	.release =3D optee_release,
-@@ -312,29 +552,36 @@ static const struct tee_driver_ops optee_ops =3D {
- 	.shm_unregister =3D optee_shm_unregister,
- };
-=20
--static const struct tee_desc optee_desc =3D {
--	.name =3D DRIVER_NAME "-clnt",
--	.ops =3D &optee_ops,
-+static const struct tee_desc optee_legacy_clnt_desc =3D {
-+	.name =3D DRIVER_NAME "legacy-clnt",
-+	.ops =3D &optee_legacy_clnt_ops,
- 	.owner =3D THIS_MODULE,
- };
-=20
--static const struct tee_driver_ops optee_supp_ops =3D {
-+static const struct tee_driver_ops optee_legacy_supp_ops =3D {
- 	.get_version =3D optee_get_version,
- 	.open =3D optee_open,
--	.release =3D optee_release,
-+	.release =3D optee_release_supp,
- 	.supp_recv =3D optee_supp_recv,
- 	.supp_send =3D optee_supp_send,
- 	.shm_register =3D optee_shm_register_supp,
- 	.shm_unregister =3D optee_shm_unregister_supp,
- };
-=20
--static const struct tee_desc optee_supp_desc =3D {
--	.name =3D DRIVER_NAME "-supp",
--	.ops =3D &optee_supp_ops,
-+static const struct tee_desc optee_legacy_supp_desc =3D {
-+	.name =3D DRIVER_NAME "legacy-supp",
-+	.ops =3D &optee_legacy_supp_ops,
- 	.owner =3D THIS_MODULE,
- 	.flags =3D TEE_DESC_PRIVILEGED,
- };
-=20
-+static const struct optee_ops optee_legacy_ops =3D {
-+	.do_call_with_arg =3D optee_do_call_with_arg,
-+	.to_msg_param =3D optee_to_msg_param,
-+	.from_msg_param =3D optee_from_msg_param,
-+};
-+
-+
- static bool optee_msg_api_uid_is_optee_api(optee_invoke_fn *invoke_fn)
- {
- 	struct arm_smccc_res res;
-@@ -534,16 +781,9 @@ static void optee_smccc_hvc(unsigned long a0, unsigne=
d long a1,
- 	arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
- }
-=20
--static optee_invoke_fn *get_invoke_func(struct device_node *np)
-+static optee_invoke_fn *get_invoke_func(const char *method)
- {
--	const char *method;
-=20
--	pr_info("probing for conduit method from DT.\n");
--
--	if (of_property_read_string(np, "method", &method)) {
--		pr_warn("missing \"method\" property\n");
--		return ERR_PTR(-ENXIO);
--	}
-=20
- 	if (!strcmp("hvc", method))
- 		return optee_smccc_hvc;
-@@ -554,7 +794,7 @@ static optee_invoke_fn *get_invoke_func(struct device_=
node *np)
- 	return ERR_PTR(-EINVAL);
- }
-=20
--static struct optee *optee_probe(struct device_node *np)
-+static struct optee *optee_probe_legacy(const char *method)
- {
- 	optee_invoke_fn *invoke_fn;
- 	struct tee_shm_pool *pool =3D ERR_PTR(-EINVAL);
-@@ -564,7 +804,7 @@ static struct optee *optee_probe(struct device_node *n=
p)
- 	u32 sec_caps;
- 	int rc;
-=20
--	invoke_fn =3D get_invoke_func(np);
-+	invoke_fn =3D get_invoke_func(method);
- 	if (IS_ERR(invoke_fn))
- 		return (void *)invoke_fn;
-=20
-@@ -606,17 +846,18 @@ static struct optee *optee_probe(struct device_node =
*np)
- 		goto err;
- 	}
-=20
-+	optee->ops =3D &optee_legacy_ops;
- 	optee->invoke_fn =3D invoke_fn;
- 	optee->sec_caps =3D sec_caps;
-=20
--	teedev =3D tee_device_alloc(&optee_desc, NULL, pool, optee);
-+	teedev =3D tee_device_alloc(&optee_legacy_clnt_desc, NULL, pool, optee);
- 	if (IS_ERR(teedev)) {
- 		rc =3D PTR_ERR(teedev);
- 		goto err;
- 	}
- 	optee->teedev =3D teedev;
-=20
--	teedev =3D tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
-+	teedev =3D tee_device_alloc(&optee_legacy_supp_desc, NULL, pool, optee);
- 	if (IS_ERR(teedev)) {
- 		rc =3D PTR_ERR(teedev);
- 		goto err;
-@@ -662,6 +903,266 @@ static struct optee *optee_probe(struct device_node =
*np)
- 	return ERR_PTR(rc);
- }
-=20
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static bool optee_ffa_api_is_compatbile(struct ffa_ops *ffa_ops, u32 dst)
-+{
-+	struct arm_smcccv1_2_return ret =3D { };
-+
-+	ret =3D ffa_ops->sync_msg_send(dst, OPTEE_FFA_GET_API_VERSION,
-+				     0, 0, 0, 0);
-+	if (ret.arg0 !=3D FFA_SUCCESS) {
-+		pr_err("Unexpected return fid 0x%llx", ret.arg0);
-+		return false;
-+	}
-+	if (ret.arg3 !=3D OPTEE_FFA_VERSION_MAJOR ||
-+	    ret.arg4 < OPTEE_FFA_VERSION_MINOR) {
-+		pr_err("Incompatible OP-TEE API version %llu.%llu",
-+		       ret.arg3, ret.arg4);
-+		return false;
-+	}
-+
-+	ret =3D ffa_ops->sync_msg_send(dst, OPTEE_FFA_GET_OS_VERSION,
-+				     0, 0, 0, 0);
-+	if (ret.arg0) {
-+		pr_err("Unexpected error 0x%llx", ret.arg0);
-+		return false;
-+	}
-+	if (ret.arg5)
-+		pr_info("revision %llu.%llu (%08llx)",
-+			ret.arg3, ret.arg4, ret.arg5);
-+	else
-+		pr_info("revision %llu.%llu", ret.arg3, ret.arg4);
-+
-+	return true;
-+}
-+
-+static bool optee_ffa_exchange_caps(struct ffa_ops *ffa_ops, u32 dst,
-+				     u32 *sec_caps)
-+{
-+	struct arm_smcccv1_2_return ret =3D { };
-+
-+	ret =3D ffa_ops->sync_msg_send(dst, OPTEE_FFA_EXCHANGE_CAPABILITIES,
-+				     0, 0, 0, 0);
-+	if (ret.arg0) {
-+		pr_err("Unexpected error 0x%llx", ret.arg0);
-+		return false;
-+	}
-+
-+	*sec_caps =3D 0;
-+
-+	return true;
-+}
-+
-+static struct tee_shm_pool *optee_ffa_config_dyn_shm(void)
-+{
-+	struct tee_shm_pool_mgr *priv_mgr;
-+	struct tee_shm_pool_mgr *dmabuf_mgr;
-+	void *rc;
-+
-+	rc =3D optee_ffa_shm_pool_alloc_pages();
-+	if (IS_ERR(rc))
-+		return rc;
-+	priv_mgr =3D rc;
-+
-+	rc =3D optee_ffa_shm_pool_alloc_pages();
-+	if (IS_ERR(rc)) {
-+		tee_shm_pool_mgr_destroy(priv_mgr);
-+		return rc;
-+	}
-+	dmabuf_mgr =3D rc;
-+
-+	rc =3D tee_shm_pool_alloc(priv_mgr, dmabuf_mgr);
-+	if (IS_ERR(rc)) {
-+		tee_shm_pool_mgr_destroy(priv_mgr);
-+		tee_shm_pool_mgr_destroy(dmabuf_mgr);
-+	}
-+
-+	return rc;
-+}
-+
-+static const struct tee_driver_ops optee_ffa_clnt_ops =3D {
-+	.get_version =3D optee_ffa_get_version,
-+	.open =3D optee_open,
-+	.release =3D optee_release,
-+	.open_session =3D optee_open_session,
-+	.close_session =3D optee_close_session,
-+	.invoke_func =3D optee_invoke_func,
-+	.cancel_req =3D optee_cancel_req,
-+	.shm_register =3D optee_ffa_shm_register,
-+	.shm_unregister =3D optee_ffa_shm_unregister,
-+};
-+
-+static const struct tee_desc optee_ffa_clnt_desc =3D {
-+	.name =3D DRIVER_NAME "ffa-clnt",
-+	.ops =3D &optee_ffa_clnt_ops,
-+	.owner =3D THIS_MODULE,
-+};
-+
-+static const struct tee_driver_ops optee_ffa_supp_ops =3D {
-+	.get_version =3D optee_ffa_get_version,
-+	.open =3D optee_open,
-+	.release =3D optee_release_supp,
-+	.supp_recv =3D optee_supp_recv,
-+	.supp_send =3D optee_supp_send,
-+	.shm_register =3D optee_ffa_shm_register, /* same as for clnt ops */
-+	.shm_unregister =3D optee_ffa_shm_unregister_supp,
-+};
-+
-+static const struct tee_desc optee_ffa_supp_desc =3D {
-+	.name =3D DRIVER_NAME "ffa-supp",
-+	.ops =3D &optee_ffa_supp_ops,
-+	.owner =3D THIS_MODULE,
-+	.flags =3D TEE_DESC_PRIVILEGED,
-+};
-+
-+static const struct optee_ops optee_ffa_ops =3D {
-+	.do_call_with_arg =3D optee_ffa_do_call_with_arg,
-+	.to_msg_param =3D optee_ffa_to_msg_param,
-+	.from_msg_param =3D optee_ffa_from_msg_param,
-+};
-+
-+static struct optee *optee_probe_ffa(void)
-+{
-+	struct tee_device *teedev =3D NULL;
-+	struct ffa_ops *ffa_ops =3D NULL;
-+	struct optee *optee =3D NULL;
-+	struct ffa_partition_info *partition_info =3D NULL;
-+	u32 ffa_dst =3D 0;
-+	u32 sec_caps =3D 0;
-+	int count =3D 0;
-+	int rc =3D 0;
-+
-+	ffa_ops =3D get_ffa_ops();
-+	if (!ffa_ops) {
-+		pr_warn("failed \"method\" init: ffa\n");
-+		return ERR_PTR(-ENOENT);
-+	}
-+	/* Use OPTEE UUID to retrieve partition ID. */
-+        count =3D ffa_ops->partition_info_get(OPTEE_MSG_OS_OPTEE_UUID_0,
-+					     OPTEE_MSG_OS_OPTEE_UUID_1,
-+					     OPTEE_MSG_OS_OPTEE_UUID_2,
-+					     OPTEE_MSG_OS_OPTEE_UUID_3,
-+					     &partition_info);
-+
-+	/* If count is negative propergate the error code. */
-+	if (count < 0) {
-+		return ERR_PTR(count);
-+	}
-+	/*
-+	 * If the function returned sucessfully we must ensure to free the
-+	 * allocated memory before exiting.
-+	 */
-+
-+	/* Check only a single patition is found.*/
-+	/* TODO: Add support for dealing with multiple partitions. */
-+	if (count > SUPPORTED_OPTEE_PARTITIONS) {
-+		kfree(partition_info);
-+		return ERR_PTR(-EINVAL);
-+	}
-+	ffa_dst =3D partition_info[0].id;
-+	kfree(partition_info);
-+
-+	if (!optee_ffa_api_is_compatbile(ffa_ops, ffa_dst))
-+		return ERR_PTR(-EINVAL);
-+
-+	if (!optee_ffa_exchange_caps(ffa_ops, ffa_dst, &sec_caps))
-+		return ERR_PTR(-EINVAL);
-+
-+	optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
-+	if (!optee) {
-+		rc =3D -ENOMEM;
-+		goto err;
-+	}
-+	optee->pool =3D optee_ffa_config_dyn_shm();
-+	if (IS_ERR(optee->pool)) {
-+		rc =3D PTR_ERR(optee->pool);
-+		optee->pool =3D NULL;
-+		goto err;
-+	}
-+
-+	optee->ops =3D &optee_ffa_ops;
-+	optee->ffa.ops =3D ffa_ops;
-+	optee->ffa.dst =3D ffa_dst;
-+	optee->sec_caps =3D sec_caps;
-+
-+	teedev =3D tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
-+				  optee);
-+	if (IS_ERR(teedev)) {
-+		rc =3D PTR_ERR(teedev);
-+		goto err;
-+	}
-+	optee->teedev =3D teedev;
-+
-+	teedev =3D tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
-+				  optee);
-+	if (IS_ERR(teedev)) {
-+		rc =3D PTR_ERR(teedev);
-+		goto err;
-+	}
-+	optee->supp_teedev =3D teedev;
-+
-+	rc =3D tee_device_register(optee->teedev);
-+	if (rc)
-+		goto err;
-+
-+	rc =3D tee_device_register(optee->supp_teedev);
-+	if (rc)
-+		goto err;
-+
-+	rc =3D rhashtable_init(&optee->ffa.global_ids, &shm_rhash_params);
-+	if (rc)
-+		goto err;
-+	mutex_init(&optee->ffa.mutex);
-+	mutex_init(&optee->call_queue.mutex);
-+	INIT_LIST_HEAD(&optee->call_queue.waiters);
-+	optee_wait_queue_init(&optee->wait_queue);
-+	optee_supp_init(&optee->supp);
-+
-+	return optee;
-+err:
-+	/*
-+	 * tee_device_unregister() is safe to call even if the
-+	 * devices hasn't been registered with
-+	 * tee_device_register() yet.
-+	 */
-+	tee_device_unregister(optee->supp_teedev);
-+	tee_device_unregister(optee->teedev);
-+	if (optee->pool)
-+		tee_shm_pool_free(optee->pool);
-+	kfree(optee);
-+	return ERR_PTR(rc);
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-+
-+static const char *get_conduit_method(struct device_node *np)
-+{
-+	const char *method =3D NULL;
-+
-+	pr_info("probing for conduit method from DT.\n");
-+
-+	if (of_property_read_string(np, "method", &method)) {
-+		pr_warn("missing \"method\" property\n");
-+		return NULL;
-+	}
-+
-+	return method;
-+}
-+
-+static struct optee *optee_probe(struct device_node *np)
-+{
-+	const char *method =3D get_conduit_method(np);
-+
-+	if (!method)
-+		return ERR_PTR(-ENXIO);
-+
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	if (!strcmp(method, "ffa"))
-+		return optee_probe_ffa();
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-+
-+	return optee_probe_legacy(method);
-+}
-+
- static void optee_remove(struct optee *optee)
- {
- 	/*
-@@ -669,7 +1170,10 @@ static void optee_remove(struct optee *optee)
- 	 * reference counters and also avoid wild pointers in secure world
- 	 * into the old shared memory range.
- 	 */
--	optee_disable_shm_cache(optee);
-+	if (optee->invoke_fn)
-+		optee_disable_shm_cache(optee);
-+	else
-+		optee_ffa_disable_shm_cache(optee);
-=20
- 	/*
- 	 * The two devices has to be unregistered before we can free the
-@@ -684,6 +1188,13 @@ static void optee_remove(struct optee *optee)
- 	optee_wait_queue_exit(&optee->wait_queue);
- 	optee_supp_uninit(&optee->supp);
- 	mutex_destroy(&optee->call_queue.mutex);
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	if (optee->ffa.ops) {
-+		mutex_destroy(&optee->ffa.mutex);
-+		rhashtable_free_and_destroy(&optee->ffa.global_ids,
-+					    rh_free_fn, NULL);
-+	}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-=20
- 	kfree(optee);
- }
-diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
-new file mode 100644
-index 000000000000..768e056ab491
---- /dev/null
-+++ b/drivers/tee/optee/optee_ffa.h
-@@ -0,0 +1,201 @@
-+/* SPDX-License-Identifier: BSD-2-Clause */
-+/*
-+ * Copyright (c) 2019, Linaro Limited
-+ */
-+
-+/*
-+ * This file is exported by OP-TEE and is in kept in sync between secure
-+ * world and normal world kernel driver. We're using ARM FF-A 1.0 EAC
-+ * specification.
-+ */
-+
-+#ifndef __OPTEE_FFA_H
-+#define __OPTEE_FFA_H
-+
-+#include <linux/arm_ffa.h>
-+
-+/*
-+ * Normal world sends requests with FFA_MSG_SEND_DIRECT_REQ and
-+ * responses are returned with FFA_MSG_SEND_DIRECT_RESP for normal
-+ * messages.
-+ *
-+ * All requests with FFA_MSG_SEND_DIRECT_REQ and FFA_MSG_SEND_DIRECT_RESP
-+ * are using the AArch32 SMC calling convention with register usage as
-+ * defined in FF-A specification:
-+ * w0:    Function ID (0x8400006F or 0x84000070)
-+ * w1:    Source/Destination IDs
-+ * w2:    Reserved (MBZ)
-+ * w3-w7: Implementation defined, free to be used below
-+ */
-+
-+#define OPTEE_FFA_VERSION_MAJOR	1
-+#define OPTEE_FFA_VERSION_MINOR	0
-+
-+#define OPTEE_FFA_BLOCKING_CALL(id)	(id)
-+#define OPTEE_FFA_YIELDING_CALL_BIT	31
-+#define OPTEE_FFA_YIELDING_CALL(id)	((id) | BIT(OPTEE_FFA_YIELDING_CALL_B=
IT))
-+
-+/*
-+ * Returns the API version implemented, currently follows the FF-A versio=
n.
-+ * Call register usage:
-+ * w3:    Service ID, OPTEE_FFA_GET_API_VERSION
-+ * w4-w7: Not used (MBZ)
-+ *
-+ * Return register usage:
-+ * w3:    OPTEE_FFA_VERSION_MAJOR
-+ * w4:    OPTEE_FFA_VERSION_MINOR
-+ * w5-w7: Not used (MBZ)
-+ */
-+#define OPTEE_FFA_GET_API_VERSION	OPTEE_FFA_BLOCKING_CALL(0)
-+
-+/*
-+ * Returns the revision of OP-TEE.
-+ *
-+ * Used by non-secure world to figure out which version of the Trusted OS
-+ * is installed. Note that the returned revision is the revision of the
-+ * Trusted OS, not of the API.
-+ *
-+ * Call register usage:
-+ * w3:    Service ID, OPTEE_FFA_GET_OS_VERSION
-+ * w4-w7: Unused (MBZ)
-+ *
-+ * Return register usage:
-+ * w3:    CFG_OPTEE_REVISION_MAJOR
-+ * w4:    CFG_OPTEE_REVISION_MINOR
-+ * w5:    TEE_IMPL_GIT_SHA1 (or zero if not supported)
-+ */
-+#define OPTEE_FFA_GET_OS_VERSION	OPTEE_FFA_BLOCKING_CALL(1)
-+
-+/*
-+ * Exchange capabilities between normal world and secure world.
-+ *
-+ * Currently there are no defined capabilities. When features are added n=
ew
-+ * capabilities may be added.
-+ *
-+ * Call register usage:
-+ * w3:    Service ID, OPTEE_FFA_EXCHANGE_CAPABILITIES
-+ * w4-w7: Note used (MBZ)
-+ *
-+ * Return register usage:
-+ * w3:    Error code, 0 on success
-+ * w4:    Bit[1:0]:  Number of pages of shared memory to register with
-+ *                   OPTEE_FFA_REGISTER_RPC_SHM to support RPC
-+ *        Bit[31:2]: Reserved (MBZ)
-+ * w5-w7: Note used (MBZ)
-+ */
-+#define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
-+
-+/*
-+ * Call with struct optee_msg_arg as argument in the supplied shared memo=
ry
-+ * with a zero internal offset and normal cached memory attributes.
-+ * Register usage:
-+ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_WITH_ARG
-+ * w4:    Shared memory handle, lower bits
-+ * w5:    Shared memory handle, higher bits
-+ * w6:    Offset into shared memory pointing to a struct optee_msg_arg
-+ * w7:    Not used (MBZ)
-+ *
-+ * Call to register shared memory memory. The data is supplied in shared
-+ * memory with a zero internal offset and normal cached memory attributes=
.
-+ * The data is formatted as described in FFA 1.0 Beta1 Table 137 "
-+ * Descriptor to retrieve a donated, lent or shared memory region".
-+ * Register usage:
-+ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_REGISTER_SHM
-+ * w4:    Shared memory handle, lower bits
-+ * w5:    Shared memory handle, higher bits
-+ * w6-w7: Not used (MBZ)
-+ *
-+ * Call unregister shared memory register usage:
-+ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM
-+ * w4:    Shared memory handle, lower bits
-+ * w5:    Shared memory handle, higher bits
-+ * w6-w7: Not used (MBZ)
-+ *
-+ * Resume from RPC register usage:
-+ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_RESUME
-+ * If returning from OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SHM:
-+ *	w4:    Shared memory handle, lower bits
-+ *	w5:    Shared memory handle, higher bits
-+ *	       If the allocation failed both w4 and w5 are 0
-+ *	w6:    Offset into shared memory pointing the table If internal
-+ *	       offset > 0 then one more page than requested has been allocated=
.
-+ * else if resuming from another RPC:
-+ *	w4-w6: Not used (MBZ)
-+ * w7:    Resume info
-+ *
-+ * Normal return (yielding call is completed) register usage:
-+ * w3:    Error code, 0 on success
-+ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_DONE
-+ * w5-w7: Not used (MBZ)
-+ *
-+ * Alloc SHM return (RPC from secure world) register usage:
-+ * w3:    Error code =3D=3D 0
-+ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM or
-+ *	  OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM
-+ *	  allocate kernel private or supplicant memory respectively.
-+ * w5:    Number of pages of shared memory
-+ * w6:    Not used (MBZ)
-+ * w7:    Resume info
-+ *
-+ * Free SHM return (RPC from secure world) register usage:
-+ * w3:    Error code =3D=3D 0
-+ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM or
-+ *	  OPTEE_FFA_YIELDING_CALL_RETURN_FREE_SUPPL_SHM
-+ *	  free kernel private or supplicant memory respectively.
-+ * w5	  Shared memory handle to free, lower bits
-+ * w6	  Shared memory handle to free, higher bits
-+ *	  The handle previously allocated with
-+ *	  OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM or
-+ *	  OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM.
-+ * w7:    Resume info
-+ *
-+ * RPC cmd return (RPC from secure world) register usage:
-+ * w3:    Error code =3D=3D 0
-+ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD
-+ * w5:    Shared memory handle, lower bits
-+ * w6:    Shared memory handle, higher bits
-+ *	  The handle contains aed the RPC.
-+ * w7:    Resume info
-+ *
-+ * RPC interrupt return (RPC from secure world) register usage:
-+ * w3:    Error code =3D=3D 0
-+ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT
-+ * w5-w6: Not used (MBZ)
-+ * w7:    Resume info
-+ *
-+ * Possible error codes in register w3:
-+ * 0:                       Success
-+ * FFA_DENIED:             w4 isn't one of OPTEE_FFA_YIELDING_CALL_START
-+ *                          OPTEE_FFA_YIELDING_CALL_REGISTER_SHM,
-+ *                          OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM or
-+ *                          OPTEE_FFA_YIELDING_CALL_RESUME
-+ *
-+ * Possible error codes for OPTEE_FFA_YIELDING_CALL_START,
-+ * OPTEE_FFA_YIELDING_CALL_REGISTER_SHM and
-+ * OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM
-+ * FFA_BUSY:               Number of OP-TEE OS threads exceeded,
-+ *                          try again later
-+ * FFA_DENIED:             RPC shared memory object not found
-+ * FFA_INVALID_PARAMETER:  Bad shared memory handle or offset into the me=
mory
-+ *
-+ * Possible error codes for OPTEE_FFA_YIELDING_CALL_RESUME
-+ * FFA_INVALID_PARAMETER:  Bad resume info
-+ *
-+ */
-+#define OPTEE_FFA_YIELDING_CALL_WITH_ARG	OPTEE_FFA_YIELDING_CALL(0)
-+#define OPTEE_FFA_YIELDING_CALL_REGISTER_SHM	OPTEE_FFA_YIELDING_CALL(1)
-+#define OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM	OPTEE_FFA_YIELDING_CALL(2)
-+#define OPTEE_FFA_YIELDING_CALL_RESUME		OPTEE_FFA_YIELDING_CALL(3)
-+
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_DONE		0
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM	1
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM	2
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_RESERVED0	3
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM	4
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_FREE_SUPPL_SHM	5
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_RESERVED1	6
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD		7
-+#define OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT	8
-+
-+#endif /*__OPTEE_FFA_H*/
-+
-diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
-index 795bc19ae17a..95ee82c11733 100644
---- a/drivers/tee/optee/optee_msg.h
-+++ b/drivers/tee/optee/optee_msg.h
-@@ -1,6 +1,5 @@
--/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
- /*
-- * Copyright (c) 2015-2019, Linaro Limited
-+ * Copyright (c) 2015-2020, Linaro Limited
-  */
- #ifndef _OPTEE_MSG_H
- #define _OPTEE_MSG_H
-@@ -11,12 +10,6 @@
- /*
-  * This file defines the OP-TEE message protocol used to communicate
-  * with an instance of OP-TEE running in secure world.
-- *
-- * This file is divided into three sections.
-- * 1. Formatting of messages.
-- * 2. Requests from normal world
-- * 3. Requests from secure world, Remote Procedure Call (RPC), handled by
-- *    tee-supplicant.
-  */
-=20
- /************************************************************************=
*****
-@@ -30,6 +23,9 @@
- #define OPTEE_MSG_ATTR_TYPE_RMEM_INPUT		0x5
- #define OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT		0x6
- #define OPTEE_MSG_ATTR_TYPE_RMEM_INOUT		0x7
-+#define OPTEE_MSG_ATTR_TYPE_SMEM_INPUT		OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
-+#define OPTEE_MSG_ATTR_TYPE_SMEM_OUTPUT		OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
-+#define OPTEE_MSG_ATTR_TYPE_SMEM_INOUT		OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
- #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT		0x9
- #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT		0xa
- #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT		0xb
-@@ -54,14 +50,14 @@
-  * Every entry in buffer should point to a 4k page beginning (12 least
-  * significant bits must be equal to zero).
-  *
-- * 12 least significant bints of optee_msg_param.u.tmem.buf_ptr should ho=
ld page
-- * offset of the user buffer.
-+ * 12 least significant bits of optee_msg_param.u.tmem.buf_ptr should hol=
d
-+ * page offset of user buffer.
-  *
-  * So, entries should be placed like members of this structure:
-  *
-  * struct page_data {
-- *   uint64_t pages_array[OPTEE_MSG_NONCONTIG_PAGE_SIZE/sizeof(uint64_t) =
- 1];
-- *   uint64_t next_page_data;
-+ *   u64 pages_array[OPTEE_MSG_NONCONTIG_PAGE_SIZE/sizeof(u64) - 1];
-+ *   u64 next_page_data;
-  * };
-  *
-  * Structure is designed to exactly fit into the page size
-@@ -129,6 +125,23 @@ struct optee_msg_param_rmem {
- 	u64 shm_ref;
- };
-=20
-+/**
-+ * struct optee_msg_param_smem - ffa memory reference parameter
-+ * @offs_lower:	   Lower bits of offset into shared memory reference
-+ * @offs_upper:	   Upper bits of offset into shared memory reference
-+ * @internal_offs: Internal offset into the first page of shared memory
-+ *		   reference
-+ * @size:	   Size of the buffer
-+ * @global_id:	   Global identifier of Shared memory
-+ */
-+struct optee_msg_param_smem {
-+	u32 offs_low;
-+	u16 offs_high;
-+	u16 internal_offs;
-+	u64 size;
-+	u64 global_id;
-+};
-+
- /**
-  * struct optee_msg_param_value - opaque value parameter
-  *
-@@ -145,12 +158,14 @@ struct optee_msg_param_value {
-  * @attr:	attributes
-  * @tmem:	parameter by temporary memory reference
-  * @rmem:	parameter by registered memory reference
-+ * @smem:	parameter by ffa registered memory reference
-  * @value:	parameter by opaque value
-  *
-  * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is u=
sed in
-  * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value,
-  * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
-- * OPTEE_MSG_ATTR_TYPE_RMEM_* indicates @rmem,
-+ * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_SMEM_* indi=
cates
-+ * @rmem or @smem depending on the conduit.
-  * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
-  */
- struct optee_msg_param {
-@@ -158,6 +173,7 @@ struct optee_msg_param {
- 	union {
- 		struct optee_msg_param_tmem tmem;
- 		struct optee_msg_param_rmem rmem;
-+		struct optee_msg_param_smem smem;
- 		struct optee_msg_param_value value;
- 	} u;
- };
-@@ -176,17 +192,9 @@ struct optee_msg_param {
-  * @params: the parameters supplied to the OS Command
-  *
-  * All normal calls to Trusted OS uses this struct. If cmd requires furth=
er
-- * information than what these field holds it can be passed as a paramete=
r
-+ * information than what these fields hold it can be passed as a paramete=
r
-  * tagged as meta (setting the OPTEE_MSG_ATTR_META bit in corresponding
-- * attrs field). All parameters tagged as meta has to come first.
-- *
-- * Temp memref parameters can be fragmented if supported by the Trusted O=
S
-- * (when optee_smc.h is bearer of this protocol this is indicated with
-- * OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM). If a logical memref parameter is
-- * fragmented then has all but the last fragment the
-- * OPTEE_MSG_ATTR_FRAGMENT bit set in attrs. Even if a memref is fragment=
ed
-- * it will still be presented as a single logical memref to the Trusted
-- * Application.
-+ * attrs field). All parameters tagged as meta have to come first.
-  */
- struct optee_msg_arg {
- 	u32 cmd;
-@@ -199,7 +207,7 @@ struct optee_msg_arg {
- 	u32 num_params;
-=20
- 	/* num_params tells the actual number of element in params */
--	struct optee_msg_param params[0];
-+	struct optee_msg_param params[];
- };
-=20
- /**
-@@ -290,13 +298,10 @@ struct optee_msg_arg {
-  * OPTEE_MSG_CMD_REGISTER_SHM registers a shared memory reference. The
-  * information is passed as:
-  * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
-- *					[| OPTEE_MSG_ATTR_FRAGMENT]
-+ *					[| OPTEE_MSG_ATTR_NONCONTIG]
-  * [in] param[0].u.tmem.buf_ptr		physical address (of first fragment)
-  * [in] param[0].u.tmem.size		size (of first fragment)
-  * [in] param[0].u.tmem.shm_ref		holds shared memory reference
-- * ...
-- * The shared memory can optionally be fragmented, temp memrefs can follo=
w
-- * each other with all but the last with the OPTEE_MSG_ATTR_FRAGMENT bit =
set.
-  *
-  * OPTEE_MSG_CMD_UNREGISTER_SHM unregisteres a previously registered shar=
ed
-  * memory reference. The information is passed as:
-@@ -313,110 +318,4 @@ struct optee_msg_arg {
- #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
- #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
-=20
--/************************************************************************=
*****
-- * Part 3 - Requests from secure world, RPC
-- ************************************************************************=
*****/
--
--/*
-- * All RPC is done with a struct optee_msg_arg as bearer of information,
-- * struct optee_msg_arg::arg holds values defined by OPTEE_MSG_RPC_CMD_* =
below
-- *
-- * RPC communication with tee-supplicant is reversed compared to normal
-- * client communication desribed above. The supplicant receives requests
-- * and sends responses.
-- */
--
--/*
-- * Load a TA into memory, defined in tee-supplicant
-- */
--#define OPTEE_MSG_RPC_CMD_LOAD_TA	0
--
--/*
-- * Reserved
-- */
--#define OPTEE_MSG_RPC_CMD_RPMB		1
--
--/*
-- * File system access, defined in tee-supplicant
-- */
--#define OPTEE_MSG_RPC_CMD_FS		2
--
--/*
-- * Get time
-- *
-- * Returns number of seconds and nano seconds since the Epoch,
-- * 1970-01-01 00:00:00 +0000 (UTC).
-- *
-- * [out] param[0].u.value.a	Number of seconds
-- * [out] param[0].u.value.b	Number of nano seconds.
-- */
--#define OPTEE_MSG_RPC_CMD_GET_TIME	3
--
--/*
-- * Wait queue primitive, helper for secure world to implement a wait queu=
e.
-- *
-- * If secure world need to wait for a secure world mutex it issues a slee=
p
-- * request instead of spinning in secure world. Conversely is a wakeup
-- * request issued when a secure world mutex with a thread waiting thread =
is
-- * unlocked.
-- *
-- * Waiting on a key
-- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP
-- * [in] param[0].u.value.b wait key
-- *
-- * Waking up a key
-- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP
-- * [in] param[0].u.value.b wakeup key
-- */
--#define OPTEE_MSG_RPC_CMD_WAIT_QUEUE	4
--#define OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP	0
--#define OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP	1
--
--/*
-- * Suspend execution
-- *
-- * [in] param[0].value	.a number of milliseconds to suspend
-- */
--#define OPTEE_MSG_RPC_CMD_SUSPEND	5
--
--/*
-- * Allocate a piece of shared memory
-- *
-- * Shared memory can optionally be fragmented, to support that additional
-- * spare param entries are allocated to make room for eventual fragments.
-- * The spare param entries has .attr =3D OPTEE_MSG_ATTR_TYPE_NONE when
-- * unused. All returned temp memrefs except the last should have the
-- * OPTEE_MSG_ATTR_FRAGMENT bit set in the attr field.
-- *
-- * [in]  param[0].u.value.a		type of memory one of
-- *					OPTEE_MSG_RPC_SHM_TYPE_* below
-- * [in]  param[0].u.value.b		requested size
-- * [in]  param[0].u.value.c		required alignment
-- *
-- * [out] param[0].u.tmem.buf_ptr	physical address (of first fragment)
-- * [out] param[0].u.tmem.size		size (of first fragment)
-- * [out] param[0].u.tmem.shm_ref	shared memory reference
-- * ...
-- * [out] param[n].u.tmem.buf_ptr	physical address
-- * [out] param[n].u.tmem.size		size
-- * [out] param[n].u.tmem.shm_ref	shared memory reference (same value
-- *					as in param[n-1].u.tmem.shm_ref)
-- */
--#define OPTEE_MSG_RPC_CMD_SHM_ALLOC	6
--/* Memory that can be shared with a non-secure user space application */
--#define OPTEE_MSG_RPC_SHM_TYPE_APPL	0
--/* Memory only shared with non-secure kernel */
--#define OPTEE_MSG_RPC_SHM_TYPE_KERNEL	1
--
--/*
-- * Free shared memory previously allocated with OPTEE_MSG_RPC_CMD_SHM_ALL=
OC
-- *
-- * [in]  param[0].u.value.a		type of memory one of
-- *					OPTEE_MSG_RPC_SHM_TYPE_* above
-- * [in]  param[0].u.value.b		value of shared memory reference
-- *					returned in param[0].u.tmem.shm_ref
-- *					above
-- */
--#define OPTEE_MSG_RPC_CMD_SHM_FREE	7
--
- #endif /* _OPTEE_MSG_H */
-diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_p=
rivate.h
-index d9c5037b4e03..d12d9b9f6d33 100644
---- a/drivers/tee/optee/optee_private.h
-+++ b/drivers/tee/optee/optee_private.h
-@@ -7,6 +7,7 @@
- #define OPTEE_PRIVATE_H
-=20
- #include <linux/arm-smccc.h>
-+#include <linux/rhashtable.h>
- #include <linux/semaphore.h>
- #include <linux/tee_drv.h>
- #include <linux/types.h>
-@@ -17,6 +18,7 @@
- /* Some Global Platform error codes used in this driver */
- #define TEEC_SUCCESS			0x00000000
- #define TEEC_ERROR_BAD_PARAMETERS	0xFFFF0006
-+#define TEEC_ERROR_NOT_SUPPORTED	0xFFFF000A
- #define TEEC_ERROR_COMMUNICATION	0xFFFF000E
- #define TEEC_ERROR_OUT_OF_MEMORY	0xFFFF000C
- #define TEEC_ERROR_SHORT_BUFFER		0xFFFF0010
-@@ -65,6 +67,32 @@ struct optee_supp {
- 	struct completion reqs_c;
- };
-=20
-+/**
-+ * struct optee_ffa_data -  FFA communication struct
-+ * @dst			FFA destination id, the id of OP-TEE in secure world
-+ * @ops			FFA operations
-+ * @mutex		Serializes access to @global_ids
-+ * @global_ids		FF-A shared memory global handle translation
-+ */
-+struct optee_ffa {
-+	u32 dst;
-+	struct ffa_ops *ops;
-+	struct mutex mutex;
-+	struct rhashtable global_ids;
-+};
-+
-+struct optee;
-+struct optee_ops {
-+	int (*do_call_with_arg)(struct tee_context *ctx,
-+				struct tee_shm *shm_arg);
-+	int (*to_msg_param)(struct optee *optee,
-+			    struct optee_msg_param *msg_params,
-+			    size_t num_params, const struct tee_param *params);
-+	int (*from_msg_param)(struct optee *optee, struct tee_param *params,
-+			      size_t num_params,
-+			      const struct optee_msg_param *msg_params);
-+};
-+
- /**
-  * struct optee - main service struct
-  * @supp_teedev:	supplicant device
-@@ -82,7 +110,11 @@ struct optee_supp {
- struct optee {
- 	struct tee_device *supp_teedev;
- 	struct tee_device *teedev;
-+	const struct optee_ops *ops;
- 	optee_invoke_fn *invoke_fn;
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	struct optee_ffa ffa;
-+#endif
- 	struct optee_call_queue call_queue;
- 	struct optee_wait_queue wait_queue;
- 	struct optee_supp supp;
-@@ -141,10 +173,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fu=
nc, u32 *num_params,
- int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
- 		    struct tee_param *param);
-=20
--u32 optee_do_call_with_arg(struct tee_context *ctx, phys_addr_t parg);
-+int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg);
- int optee_open_session(struct tee_context *ctx,
- 		       struct tee_ioctl_open_session_arg *arg,
- 		       struct tee_param *param);
-+int optee_close_session_helper(struct tee_context *ctx, u32 session);
- int optee_close_session(struct tee_context *ctx, u32 session);
- int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_ar=
g *arg,
- 		      struct tee_param *param);
-@@ -163,11 +196,6 @@ int optee_shm_register_supp(struct tee_context *ctx, =
struct tee_shm *shm,
- 			    unsigned long start);
- int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *sh=
m);
-=20
--int optee_from_msg_param(struct tee_param *params, size_t num_params,
--			 const struct optee_msg_param *msg_params);
--int optee_to_msg_param(struct optee_msg_param *msg_params, size_t num_par=
ams,
--		       const struct tee_param *params);
--
- u64 *optee_allocate_pages_list(size_t num_entries);
- void optee_free_pages_list(void *array, size_t num_entries);
- void optee_fill_pages_list(u64 *dst, struct page **pages, int num_pages,
-@@ -175,6 +203,27 @@ void optee_fill_pages_list(u64 *dst, struct page **pa=
ges, int num_pages,
-=20
- int optee_enumerate_devices(void);
-=20
-+int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
-+			     u64 global_id);
-+int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id);
-+
-+struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 global=
_id);
-+void optee_ffa_disable_shm_cache(struct optee *optee);
-+
-+int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
-+			    struct page **pages, size_t num_pages,
-+			    unsigned long start);
-+int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *shm=
);
-+int optee_ffa_shm_register_supp(struct tee_context *ctx, struct tee_shm *=
shm,
-+				 struct page **pages, size_t num_pages,
-+				 unsigned long start);
-+int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
-+				   struct tee_shm *shm);
-+
-+int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm *a=
rg);
-+int optee_ffa_rpc_shm_register(struct tee_context *ctx, struct tee_shm *s=
hm);
-+void optee_handle_ffa_rpc(struct tee_context *ctx, u32 *w4, u32 *w5, u32 =
*w6);
-+
- /*
-  * Small helpers
-  */
-diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee_r=
pc_cmd.h
-new file mode 100644
-index 000000000000..712aa32513d7
---- /dev/null
-+++ b/drivers/tee/optee/optee_rpc_cmd.h
-@@ -0,0 +1,333 @@
-+/* SPDX-License-Identifier: BSD-2-Clause */
-+/*
-+ * Copyright (c) 2016-2018, Linaro Limited
-+ */
-+
-+#ifndef __OPTEE_RPC_CMD_H
-+#define __OPTEE_RPC_CMD_H
-+
-+/*
-+ * All RPC is done with a struct optee_msg_arg as bearer of information,
-+ * struct optee_msg_arg::arg holds values defined by OPTEE_RPC_CMD_* belo=
w.
-+ * Only the commands handled by the kernel driver are defined here.
-+ *
-+ * RPC communication with tee-supplicant is reversed compared to normal
-+ * client communication described above. The supplicant receives requests
-+ * and sends responses.
-+ */
-+
-+/*
-+ * Load a TA into memory
-+ *
-+ * Since the size of the TA isn't known in advance the size of the TA is
-+ * can be queried with a NULL buffer.
-+ *
-+ * [in]     value[0].a-b    UUID
-+ * [out]    memref[1]	    Buffer with TA
-+ */
-+#define OPTEE_RPC_CMD_LOAD_TA		0
-+
-+/*
-+ * Replay Protected Memory Block access
-+ *
-+ * [in]     memref[0]	    Frames to device
-+ * [out]    memref[1]	    Frames from device
-+ */
-+#define OPTEE_RPC_CMD_RPMB		1
-+
-+/*
-+ * File system access, see definition of protocol below
-+ */
-+#define OPTEE_RPC_CMD_FS		2
-+
-+/*
-+ * Get time
-+ *
-+ * Returns number of seconds and nano seconds since the Epoch,
-+ * 1970-01-01 00:00:00 +0000 (UTC).
-+ *
-+ * [out]    value[0].a	    Number of seconds
-+ * [out]    value[0].b	    Number of nano seconds.
-+ */
-+#define OPTEE_RPC_CMD_GET_TIME		3
-+
-+/*
-+ * Wait queue primitive, helper for secure world to implement a wait queu=
e.
-+ *
-+ * If secure world needs to wait for a secure world mutex it issues a sle=
ep
-+ * request instead of spinning in secure world. Conversely is a wakeup
-+ * request issued when a secure world mutex with a thread waiting thread =
is
-+ * unlocked.
-+ *
-+ * Waiting on a key
-+ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_SLEEP
-+ * [in]    value[0].b	    Wait key
-+ *
-+ * Waking up a key
-+ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_WAKEUP
-+ * [in]    value[0].b	    Wakeup key
-+ */
-+#define OPTEE_RPC_CMD_WAIT_QUEUE	4
-+#define OPTEE_RPC_WAIT_QUEUE_SLEEP	0
-+#define OPTEE_RPC_WAIT_QUEUE_WAKEUP	1
-+
-+/*
-+ * Suspend execution
-+ *
-+ * [in]    value[0].a	Number of milliseconds to suspend
-+ */
-+#define OPTEE_RPC_CMD_SUSPEND		5
-+
-+/*
-+ * Allocate a piece of shared memory
-+ *
-+ * [in]    value[0].a	    Type of memory one of
-+ *			    OPTEE_RPC_SHM_TYPE_* below
-+ * [in]    value[0].b	    Requested size
-+ * [in]    value[0].c	    Required alignment
-+ * [out]   memref[0]	    Buffer
-+ */
-+#define OPTEE_RPC_CMD_SHM_ALLOC		6
-+/* Memory that can be shared with a non-secure user space application */
-+#define OPTEE_RPC_SHM_TYPE_APPL		0
-+/* Memory only shared with non-secure kernel */
-+#define OPTEE_RPC_SHM_TYPE_KERNEL	1
-+/*
-+ * Memory shared with non-secure kernel and exported to a non-secure user
-+ * space application
-+ */
-+#define OPTEE_RPC_SHM_TYPE_GLOBAL	2
-+
-+/*
-+ * Free shared memory previously allocated with OPTEE_RPC_CMD_SHM_ALLOC
-+ *
-+ * [in]     value[0].a	    Type of memory one of
-+ *			    OPTEE_RPC_SHM_TYPE_* above
-+ * [in]     value[0].b	    Value of shared memory reference or cookie
-+ */
-+#define OPTEE_RPC_CMD_SHM_FREE		7
-+
-+/* Was OPTEE_RPC_CMD_SQL_FS, which isn't supported any longer */
-+#define OPTEE_RPC_CMD_SQL_FS_RESERVED	8
-+
-+/*
-+ * Send TA profiling information to normal world
-+ *
-+ * [in/out] value[0].a	    File identifier. Must be set to 0 on
-+ *			    first call. A value >=3D 1 will be
-+ *			    returned on success. Re-use this value
-+ *			    to append data to the same file.
-+ * [in]     memref[1]	    TA UUID
-+ * [in]     memref[2]	    Profile data
-+ */
-+#define OPTEE_RPC_CMD_GPROF		9
-+
-+/*
-+ * Socket command, see definition of protocol below
-+ */
-+#define OPTEE_RPC_CMD_SOCKET		10
-+
-+/*
-+ * Send TA function graph data to normal world
-+ *
-+ * [in/out] value[0].a	    File identifier. Must be set to 0 on
-+ *			    first call. A value >=3D 1 will be
-+ *			    returned on success. Re-use this value
-+ *			    to append data to the same file.
-+ * [in]     memref[1]	    TA UUID
-+ * [in]     memref[2]	    function graph data
-+ */
-+#define OPTEE_RPC_CMD_FTRACE		11
-+
-+/*
-+ * Register timestamp buffer in the linux kernel optee driver
-+ *
-+ * [in]     value[0].a	    Subcommand (register buffer, unregister buffer=
)
-+ *			    OPTEE_RPC_CMD_BENCH_REG_* below
-+ * [in]     value[0].b	    Physical address of timestamp buffer
-+ * [in]     value[0].c	    Size of buffer
-+ */
-+#define OPTEE_RPC_CMD_BENCH_REG_NEW	0
-+#define OPTEE_RPC_CMD_BENCH_REG_DEL	1
-+#define OPTEE_RPC_CMD_BENCH_REG		20
-+
-+/*
-+ * Definition of protocol for command OPTEE_RPC_CMD_FS
-+ */
-+
-+/*
-+ * Open a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_OPEN
-+ * [in]     memref[1]	    A string holding the file name
-+ * [out]    value[2].a	    File descriptor of open file
-+ */
-+#define OPTEE_RPC_FS_OPEN		0
-+
-+/*
-+ * Create a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_CREATE
-+ * [in]     memref[1]	    A string holding the file name
-+ * [out]    value[2].a	    File descriptor of open file
-+ */
-+#define OPTEE_RPC_FS_CREATE		1
-+
-+/*
-+ * Close a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_CLOSE
-+ * [in]     value[0].b	    File descriptor of open file.
-+ */
-+#define OPTEE_RPC_FS_CLOSE		2
-+
-+/*
-+ * Read from a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_READ
-+ * [in]     value[0].b	    File descriptor of open file
-+ * [in]     value[0].c	    Offset into file
-+ * [out]    memref[1]	    Buffer to hold returned data
-+ */
-+#define OPTEE_RPC_FS_READ		3
-+
-+/*
-+ * Write to a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_WRITE
-+ * [in]     value[0].b	    File descriptor of open file
-+ * [in]     value[0].c	    Offset into file
-+ * [in]     memref[1]	    Buffer holding data to be written
-+ */
-+#define OPTEE_RPC_FS_WRITE		4
-+
-+/*
-+ * Truncate a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_TRUNCATE
-+ * [in]     value[0].b	    File descriptor of open file
-+ * [in]     value[0].c	    Length of file.
-+ */
-+#define OPTEE_RPC_FS_TRUNCATE		5
-+
-+/*
-+ * Remove a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_REMOVE
-+ * [in]     memref[1]	    A string holding the file name
-+ */
-+#define OPTEE_RPC_FS_REMOVE		6
-+
-+/*
-+ * Rename a file
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_RENAME
-+ * [in]     value[0].b	    True if existing target should be removed
-+ * [in]     memref[1]	    A string holding the old file name
-+ * [in]     memref[2]	    A string holding the new file name
-+ */
-+#define OPTEE_RPC_FS_RENAME		7
-+
-+/*
-+ * Opens a directory for file listing
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_OPENDIR
-+ * [in]     memref[1]	    A string holding the name of the directory
-+ * [out]    value[2].a	    Handle to open directory
-+ */
-+#define OPTEE_RPC_FS_OPENDIR		8
-+
-+/*
-+ * Closes a directory handle
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_CLOSEDIR
-+ * [in]     value[0].b	    Handle to open directory
-+ */
-+#define OPTEE_RPC_FS_CLOSEDIR		9
-+
-+/*
-+ * Read next file name of directory
-+ *
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_FS_READDIR
-+ * [in]     value[0].b	    Handle to open directory
-+ * [out]    memref[1]	    A string holding the file name
-+ */
-+#define OPTEE_RPC_FS_READDIR		10
-+
-+/* End of definition of protocol for command OPTEE_RPC_CMD_FS */
-+
-+/*
-+ * Definition of protocol for command OPTEE_RPC_CMD_SOCKET
-+ */
-+
-+#define OPTEE_RPC_SOCKET_TIMEOUT_NONBLOCKING	0
-+#define OPTEE_RPC_SOCKET_TIMEOUT_BLOCKING	0xffffffff
-+
-+/*
-+ * Open socket
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_SOCKET_OPEN
-+ * [in]     value[0].b	    TA instance id
-+ * [in]     value[1].a	    Server port number
-+ * [in]     value[1].b	    Protocol, TEE_ISOCKET_PROTOCOLID_*
-+ * [in]     value[1].c	    Ip version TEE_IP_VERSION_* from tee_ipsocket.=
h
-+ * [in]     memref[2]	    Server address
-+ * [out]    value[3].a	    Socket handle (32-bit)
-+ */
-+#define OPTEE_RPC_SOCKET_OPEN	0
-+
-+/*
-+ * Close socket
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_SOCKET_CLOSE
-+ * [in]     value[0].b	    TA instance id
-+ * [in]     value[0].c	    Socket handle
-+ */
-+#define OPTEE_RPC_SOCKET_CLOSE	1
-+
-+/*
-+ * Close all sockets
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_SOCKET_CLOSE_ALL
-+ * [in]     value[0].b	    TA instance id
-+ */
-+#define OPTEE_RPC_SOCKET_CLOSE_ALL 2
-+
-+/*
-+ * Send data on socket
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_SOCKET_SEND
-+ * [in]     value[0].b	    TA instance id
-+ * [in]     value[0].c	    Socket handle
-+ * [in]     memref[1]	    Buffer to transmit
-+ * [in]     value[2].a	    Timeout ms or OPTEE_RPC_SOCKET_TIMEOUT_*
-+ * [out]    value[2].b	    Number of transmitted bytes
-+ */
-+#define OPTEE_RPC_SOCKET_SEND	3
-+
-+/*
-+ * Receive data on socket
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_SOCKET_RECV
-+ * [in]     value[0].b	    TA instance id
-+ * [in]     value[0].c	    Socket handle
-+ * [out]    memref[1]	    Buffer to receive
-+ * [in]     value[2].a	    Timeout ms or OPTEE_RPC_SOCKET_TIMEOUT_*
-+ */
-+#define OPTEE_RPC_SOCKET_RECV	4
-+
-+/*
-+ * Perform IOCTL on socket
-+ *
-+ * [in]     value[0].a	    OPTEE_RPC_SOCKET_IOCTL
-+ * [in]     value[0].b	    TA instance id
-+ * [in]     value[0].c	    Socket handle
-+ * [in/out] memref[1]	    Buffer
-+ * [in]     value[2].a	    Ioctl command
-+ */
-+#define OPTEE_RPC_SOCKET_IOCTL	5
-+
-+/* End of definition of protocol for command OPTEE_RPC_CMD_SOCKET */
-+
-+#endif /*__OPTEE_RPC_CMD_H*/
-diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
-index b4ade54d1f28..ca5d5d01b58f 100644
---- a/drivers/tee/optee/rpc.c
-+++ b/drivers/tee/optee/rpc.c
-@@ -9,8 +9,11 @@
- #include <linux/device.h>
- #include <linux/slab.h>
- #include <linux/tee_drv.h>
-+#include "optee_msg.h"
- #include "optee_private.h"
-+#include "optee_rpc_cmd.h"
- #include "optee_smc.h"
-+#include "optee_ffa.h"
-=20
- struct wq_entry {
- 	struct list_head link;
-@@ -102,10 +105,10 @@ static void handle_rpc_func_cmd_wq(struct optee *opt=
ee,
- 		goto bad;
-=20
- 	switch (arg->params[0].u.value.a) {
--	case OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP:
-+	case OPTEE_RPC_WAIT_QUEUE_SLEEP:
- 		wq_sleep(&optee->wait_queue, arg->params[0].u.value.b);
- 		break;
--	case OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP:
-+	case OPTEE_RPC_WAIT_QUEUE_WAKEUP:
- 		wq_wakeup(&optee->wait_queue, arg->params[0].u.value.b);
- 		break;
- 	default:
-@@ -140,10 +143,10 @@ static void handle_rpc_func_cmd_wait(struct optee_ms=
g_arg *arg)
- 	arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
- }
-=20
--static void handle_rpc_supp_cmd(struct tee_context *ctx,
-+static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *op=
tee,
- 				struct optee_msg_arg *arg)
- {
--	struct tee_param *params;
-+	struct tee_param *params =3D NULL;
-=20
- 	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
-=20
-@@ -154,32 +157,36 @@ static void handle_rpc_supp_cmd(struct tee_context *=
ctx,
- 		return;
- 	}
-=20
--	if (optee_from_msg_param(params, arg->num_params, arg->params)) {
-+	if (optee->ops->from_msg_param(optee, params, arg->num_params,
-+				       arg->params)) {
- 		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
- 		goto out;
- 	}
-=20
- 	arg->ret =3D optee_supp_thrd_req(ctx, arg->cmd, arg->num_params, params)=
;
-=20
--	if (optee_to_msg_param(arg->params, arg->num_params, params))
-+	if (optee->ops->to_msg_param(optee, arg->params, arg->num_params,
-+				     params))
- 		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
- out:
- 	kfree(params);
- }
-=20
-+
-+
- static struct tee_shm *cmd_alloc_suppl(struct tee_context *ctx, size_t sz=
)
- {
--	u32 ret;
--	struct tee_param param;
- 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
--	struct tee_shm *shm;
-+	struct tee_param param =3D { };
-+	struct tee_shm *shm =3D NULL;
-+	u32 ret =3D 0;
-=20
- 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
--	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
-+	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
- 	param.u.value.b =3D sz;
- 	param.u.value.c =3D 0;
-=20
--	ret =3D optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_ALLOC, 1, &param)=
;
-+	ret =3D optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_ALLOC, 1, &param);
- 	if (ret)
- 		return ERR_PTR(-ENOMEM);
-=20
-@@ -216,10 +223,10 @@ static void handle_rpc_func_cmd_shm_alloc(struct tee=
_context *ctx,
-=20
- 	sz =3D arg->params[0].u.value.b;
- 	switch (arg->params[0].u.value.a) {
--	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
-+	case OPTEE_RPC_SHM_TYPE_APPL:
- 		shm =3D cmd_alloc_suppl(ctx, sz);
- 		break;
--	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
-+	case OPTEE_RPC_SHM_TYPE_KERNEL:
- 		shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED);
- 		break;
- 	default:
-@@ -291,7 +298,7 @@ static void cmd_free_suppl(struct tee_context *ctx, st=
ruct tee_shm *shm)
- 	struct tee_param param;
-=20
- 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
--	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
-+	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
- 	param.u.value.b =3D tee_shm_get_id(shm);
- 	param.u.value.c =3D 0;
-=20
-@@ -308,7 +315,7 @@ static void cmd_free_suppl(struct tee_context *ctx, st=
ruct tee_shm *shm)
- 	 */
- 	tee_shm_put(shm);
-=20
--	optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_FREE, 1, &param);
-+	optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_FREE, 1, &param);
- }
-=20
- static void handle_rpc_func_cmd_shm_free(struct tee_context *ctx,
-@@ -326,10 +333,10 @@ static void handle_rpc_func_cmd_shm_free(struct tee_=
context *ctx,
-=20
- 	shm =3D (struct tee_shm *)(unsigned long)arg->params[0].u.value.b;
- 	switch (arg->params[0].u.value.a) {
--	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
-+	case OPTEE_RPC_SHM_TYPE_APPL:
- 		cmd_free_suppl(ctx, shm);
- 		break;
--	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
-+	case OPTEE_RPC_SHM_TYPE_KERNEL:
- 		tee_shm_free(shm);
- 		break;
- 	default:
-@@ -357,7 +364,7 @@ static void handle_rpc_func_cmd(struct tee_context *ct=
x, struct optee *optee,
- 				struct tee_shm *shm,
- 				struct optee_call_ctx *call_ctx)
- {
--	struct optee_msg_arg *arg;
-+	struct optee_msg_arg *arg =3D NULL;
-=20
- 	arg =3D tee_shm_get_va(shm, 0);
- 	if (IS_ERR(arg)) {
-@@ -366,24 +373,24 @@ static void handle_rpc_func_cmd(struct tee_context *=
ctx, struct optee *optee,
- 	}
-=20
- 	switch (arg->cmd) {
--	case OPTEE_MSG_RPC_CMD_GET_TIME:
-+	case OPTEE_RPC_CMD_GET_TIME:
- 		handle_rpc_func_cmd_get_time(arg);
- 		break;
--	case OPTEE_MSG_RPC_CMD_WAIT_QUEUE:
-+	case OPTEE_RPC_CMD_WAIT_QUEUE:
- 		handle_rpc_func_cmd_wq(optee, arg);
- 		break;
--	case OPTEE_MSG_RPC_CMD_SUSPEND:
-+	case OPTEE_RPC_CMD_SUSPEND:
- 		handle_rpc_func_cmd_wait(arg);
- 		break;
--	case OPTEE_MSG_RPC_CMD_SHM_ALLOC:
-+	case OPTEE_RPC_CMD_SHM_ALLOC:
- 		free_pages_list(call_ctx);
- 		handle_rpc_func_cmd_shm_alloc(ctx, arg, call_ctx);
- 		break;
--	case OPTEE_MSG_RPC_CMD_SHM_FREE:
-+	case OPTEE_RPC_CMD_SHM_FREE:
- 		handle_rpc_func_cmd_shm_free(ctx, arg);
- 		break;
- 	default:
--		handle_rpc_supp_cmd(ctx, arg);
-+		handle_rpc_supp_cmd(ctx, optee, arg);
- 	}
- }
-=20
-@@ -441,3 +448,95 @@ void optee_handle_rpc(struct tee_context *ctx, struct=
 optee_rpc_param *param,
-=20
- 	param->a0 =3D OPTEE_SMC_CALL_RETURN_FROM_RPC;
- }
-+
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static void handle_ffa_rpc_func_cmd(struct tee_context *ctx,
-+				     struct optee *optee,
-+				     struct optee_msg_arg *arg)
-+{
-+	switch (arg->cmd) {
-+	case OPTEE_RPC_CMD_GET_TIME:
-+		handle_rpc_func_cmd_get_time(arg);
-+		break;
-+	case OPTEE_RPC_CMD_WAIT_QUEUE:
-+		handle_rpc_func_cmd_wq(optee, arg);
-+		break;
-+	case OPTEE_RPC_CMD_SUSPEND:
-+		handle_rpc_func_cmd_wait(arg);
-+		break;
-+	case OPTEE_RPC_CMD_SHM_ALLOC:
-+	case OPTEE_RPC_CMD_SHM_FREE:
-+		pr_err("%s: RPC cmd 0x%x: not supported\n", __func__,
-+		       arg->cmd);
-+		arg->ret =3D TEEC_ERROR_NOT_SUPPORTED;
-+		break;
-+	default:
-+		handle_rpc_supp_cmd(ctx, optee, arg);
-+	}
-+}
-+
-+void optee_handle_ffa_rpc(struct tee_context *ctx, u32 *w4, u32 *w5, u32 =
*w6)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	struct tee_shm *shm =3D NULL;
-+	struct optee_msg_arg *rpc_arg =3D NULL;
-+	u64 global_handle =3D 0;
-+	u32 cmd =3D *w4;
-+
-+	switch (cmd) {
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM:
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM:
-+		if (cmd =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM)
-+			shm =3D tee_shm_alloc(ctx, *w5 * PAGE_SIZE,
-+					    TEE_SHM_MAPPED);
-+		else
-+			shm =3D cmd_alloc_suppl(ctx, *w5 * PAGE_SIZE);
-+
-+		if (IS_ERR_OR_NULL(shm))
-+			break;
-+
-+		*w4 =3D shm->sec_world_id;
-+		*w5 =3D shm->sec_world_id >> 32;
-+		*w6 =3D shm->offset;
-+		return;
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM:
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_FREE_SUPPL_SHM:
-+		global_handle =3D *w5 | ((u64)*w6 << 32);
-+		shm =3D optee_shm_from_ffa_handle(optee, global_handle);
-+		if (!shm) {
-+			pr_err("Invalid global handle 0x%llx\n", global_handle);
-+			break;
-+		}
-+		if (cmd =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM)
-+			tee_shm_free(shm);
-+		else
-+			cmd_free_suppl(ctx, shm);
-+		break;
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD:
-+		global_handle =3D *w5 | ((u64)*w6 << 32);
-+		shm =3D optee_shm_from_ffa_handle(optee, global_handle);
-+		if (!shm) {
-+			pr_err("Invalid global handle 0x%llx\n", global_handle);
-+			break;
-+		}
-+		rpc_arg =3D tee_shm_get_va(shm, 0);
-+		if (IS_ERR(rpc_arg)) {
-+			pr_err("Invalid offset 0 for global handle 0x%llx\n",
-+			       global_handle);
-+			break;
-+		}
-+		handle_ffa_rpc_func_cmd(ctx, optee, rpc_arg);
-+		break;
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT:
-+		/* Interrupt delivered by now */
-+		break;
-+	default:
-+		pr_warn("Unknown RPC func 0x%x\n", cmd);
-+		break;
-+	}
-+
-+	*w4 =3D 0;
-+	*w5 =3D 0;
-+	*w6 =3D 0;
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-diff --git a/drivers/tee/optee/shm_pool.c b/drivers/tee/optee/shm_pool.c
-index d767eebf30bd..ffc6821f6ce3 100644
---- a/drivers/tee/optee/shm_pool.c
-+++ b/drivers/tee/optee/shm_pool.c
-@@ -87,3 +87,53 @@ struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(voi=
d)
-=20
- 	return mgr;
- }
-+
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static int pool_ffa_op_alloc(struct tee_shm_pool_mgr *poolm,
-+			 struct tee_shm *shm, size_t size)
-+{
-+	unsigned int order =3D get_order(size);
-+	struct page *page;
-+	int rc =3D 0;
-+
-+	page =3D alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
-+	if (!page)
-+		return -ENOMEM;
-+
-+	shm->kaddr =3D page_address(page);
-+	shm->paddr =3D page_to_phys(page);
-+	shm->size =3D PAGE_SIZE << order;
-+
-+	shm->flags |=3D TEE_SHM_REGISTER;
-+	rc =3D optee_ffa_shm_register(shm->ctx, shm, &page, 1 << order,
-+				     (unsigned long)shm->kaddr);
-+
-+	return rc;
-+}
-+
-+static void pool_ffa_op_free(struct tee_shm_pool_mgr *poolm,
-+			 struct tee_shm *shm)
-+{
-+	optee_ffa_shm_unregister(shm->ctx, shm);
-+	free_pages((unsigned long)shm->kaddr, get_order(shm->size));
-+	shm->kaddr =3D NULL;
-+}
-+
-+static const struct tee_shm_pool_mgr_ops pool_ffa_ops =3D {
-+	.alloc =3D pool_ffa_op_alloc,
-+	.free =3D pool_ffa_op_free,
-+	.destroy_poolmgr =3D pool_op_destroy_poolmgr,
-+};
-+
-+struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void)
-+{
-+	struct tee_shm_pool_mgr *mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
-+
-+	if (!mgr)
-+		return ERR_PTR(-ENOMEM);
-+
-+	mgr->ops =3D &pool_ffa_ops;
-+
-+	return mgr;
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-diff --git a/drivers/tee/optee/shm_pool.h b/drivers/tee/optee/shm_pool.h
-index 28109d991c4b..34c5fd74a3ff 100644
---- a/drivers/tee/optee/shm_pool.h
-+++ b/drivers/tee/optee/shm_pool.h
-@@ -10,5 +10,6 @@
- #include <linux/tee_drv.h>
-=20
- struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(void);
-+struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void);
-=20
- #endif
-diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
-index 3d32a2ca48c3..974fe7081225 100644
---- a/drivers/tee/tee_core.c
-+++ b/drivers/tee/tee_core.c
-@@ -59,7 +59,6 @@ static struct tee_context *teedev_open(struct tee_device=
 *teedev)
-=20
- 	kref_init(&ctx->refcount);
- 	ctx->teedev =3D teedev;
--	INIT_LIST_HEAD(&ctx->list_shm);
- 	rc =3D teedev->desc->ops->open(ctx);
- 	if (rc)
- 		goto err;
-diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
-index 09ddcd06c715..deb22f877881 100644
---- a/drivers/tee/tee_shm.c
-+++ b/drivers/tee/tee_shm.c
-@@ -13,13 +13,13 @@
-=20
- static void tee_shm_release(struct tee_shm *shm)
- {
--	struct tee_device *teedev =3D shm->teedev;
-+	struct tee_device *teedev =3D shm->ctx->teedev;
-=20
--	mutex_lock(&teedev->mutex);
--	idr_remove(&teedev->idr, shm->id);
--	if (shm->ctx)
--		list_del(&shm->link);
--	mutex_unlock(&teedev->mutex);
-+	if (shm->flags & TEE_SHM_DMA_BUF) {
-+		mutex_lock(&teedev->mutex);
-+		idr_remove(&teedev->idr, shm->id);
-+		mutex_unlock(&teedev->mutex);
-+	}
-=20
- 	if (shm->flags & TEE_SHM_POOL) {
- 		struct tee_shm_pool_mgr *poolm;
-@@ -44,8 +44,7 @@ static void tee_shm_release(struct tee_shm *shm)
- 		kfree(shm->pages);
- 	}
-=20
--	if (shm->ctx)
--		teedev_ctx_put(shm->ctx);
-+	teedev_ctx_put(shm->ctx);
-=20
- 	kfree(shm);
-=20
-@@ -82,7 +81,7 @@ static int tee_shm_op_mmap(struct dma_buf *dmabuf, struc=
t vm_area_struct *vma)
- 	size_t size =3D vma->vm_end - vma->vm_start;
-=20
- 	/* Refuse sharing shared memory provided by application */
--	if (shm->flags & TEE_SHM_REGISTER)
-+	if (shm->flags & TEE_SHM_USER_MAPPED)
- 		return -EINVAL;
-=20
- 	return remap_pfn_range(vma, vma->vm_start, shm->paddr >> PAGE_SHIFT,
-@@ -97,20 +96,14 @@ static const struct dma_buf_ops tee_shm_dma_buf_ops =
=3D {
- 	.mmap =3D tee_shm_op_mmap,
- };
-=20
--static struct tee_shm *__tee_shm_alloc(struct tee_context *ctx,
--				       struct tee_device *teedev,
--				       size_t size, u32 flags)
-+struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 f=
lags)
- {
-+	struct tee_device *teedev =3D ctx->teedev;
- 	struct tee_shm_pool_mgr *poolm =3D NULL;
- 	struct tee_shm *shm;
- 	void *ret;
- 	int rc;
-=20
--	if (ctx && ctx->teedev !=3D teedev) {
--		dev_err(teedev->dev.parent, "ctx and teedev mismatch\n");
--		return ERR_PTR(-EINVAL);
--	}
--
- 	if (!(flags & TEE_SHM_MAPPED)) {
- 		dev_err(teedev->dev.parent,
- 			"only mapped allocations supported\n");
-@@ -138,7 +131,6 @@ static struct tee_shm *__tee_shm_alloc(struct tee_cont=
ext *ctx,
- 	}
-=20
- 	shm->flags =3D flags | TEE_SHM_POOL;
--	shm->teedev =3D teedev;
- 	shm->ctx =3D ctx;
- 	if (flags & TEE_SHM_DMA_BUF)
- 		poolm =3D teedev->pool->dma_buf_mgr;
-@@ -151,17 +143,18 @@ static struct tee_shm *__tee_shm_alloc(struct tee_co=
ntext *ctx,
- 		goto err_kfree;
- 	}
-=20
--	mutex_lock(&teedev->mutex);
--	shm->id =3D idr_alloc(&teedev->idr, shm, 1, 0, GFP_KERNEL);
--	mutex_unlock(&teedev->mutex);
--	if (shm->id < 0) {
--		ret =3D ERR_PTR(shm->id);
--		goto err_pool_free;
--	}
-=20
- 	if (flags & TEE_SHM_DMA_BUF) {
- 		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
-=20
-+		mutex_lock(&teedev->mutex);
-+		shm->id =3D idr_alloc(&teedev->idr, shm, 1, 0, GFP_KERNEL);
-+		mutex_unlock(&teedev->mutex);
-+		if (shm->id < 0) {
-+			ret =3D ERR_PTR(shm->id);
-+			goto err_pool_free;
-+		}
-+
- 		exp_info.ops =3D &tee_shm_dma_buf_ops;
- 		exp_info.size =3D shm->size;
- 		exp_info.flags =3D O_RDWR;
-@@ -174,18 +167,16 @@ static struct tee_shm *__tee_shm_alloc(struct tee_co=
ntext *ctx,
- 		}
- 	}
-=20
--	if (ctx) {
-+	if (ctx)
- 		teedev_ctx_get(ctx);
--		mutex_lock(&teedev->mutex);
--		list_add_tail(&shm->link, &ctx->list_shm);
--		mutex_unlock(&teedev->mutex);
--	}
-=20
- 	return shm;
- err_rem:
--	mutex_lock(&teedev->mutex);
--	idr_remove(&teedev->idr, shm->id);
--	mutex_unlock(&teedev->mutex);
-+	if (flags & TEE_SHM_DMA_BUF) {
-+		mutex_lock(&teedev->mutex);
-+		idr_remove(&teedev->idr, shm->id);
-+		mutex_unlock(&teedev->mutex);
-+	}
- err_pool_free:
- 	poolm->ops->free(poolm, shm);
- err_kfree:
-@@ -194,31 +185,8 @@ static struct tee_shm *__tee_shm_alloc(struct tee_con=
text *ctx,
- 	tee_device_put(teedev);
- 	return ret;
- }
--
--/**
-- * tee_shm_alloc() - Allocate shared memory
-- * @ctx:	Context that allocates the shared memory
-- * @size:	Requested size of shared memory
-- * @flags:	Flags setting properties for the requested shared memory.
-- *
-- * Memory allocated as global shared memory is automatically freed when t=
he
-- * TEE file pointer is closed. The @flags field uses the bits defined by
-- * TEE_SHM_* in <linux/tee_drv.h>. TEE_SHM_MAPPED must currently always b=
e
-- * set. If TEE_SHM_DMA_BUF global shared memory will be allocated and
-- * associated with a dma-buf handle, else driver private memory.
-- */
--struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 f=
lags)
--{
--	return __tee_shm_alloc(ctx, ctx->teedev, size, flags);
--}
- EXPORT_SYMBOL_GPL(tee_shm_alloc);
-=20
--struct tee_shm *tee_shm_priv_alloc(struct tee_device *teedev, size_t size=
)
--{
--	return __tee_shm_alloc(NULL, teedev, size, TEE_SHM_MAPPED);
--}
--EXPORT_SYMBOL_GPL(tee_shm_priv_alloc);
--
- struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long a=
ddr,
- 				 size_t length, u32 flags)
- {
-@@ -251,7 +219,6 @@ struct tee_shm *tee_shm_register(struct tee_context *c=
tx, unsigned long addr,
- 	}
-=20
- 	shm->flags =3D flags | TEE_SHM_REGISTER;
--	shm->teedev =3D teedev;
- 	shm->ctx =3D ctx;
- 	shm->id =3D -1;
- 	addr =3D untagged_addr(addr);
-@@ -307,10 +274,6 @@ struct tee_shm *tee_shm_register(struct tee_context *=
ctx, unsigned long addr,
- 		}
- 	}
-=20
--	mutex_lock(&teedev->mutex);
--	list_add_tail(&shm->link, &ctx->list_shm);
--	mutex_unlock(&teedev->mutex);
--
- 	return shm;
- err:
- 	if (shm) {
-diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
-index 545a57f61a5e..407c27c11b2b 100644
---- a/include/linux/tee_drv.h
-+++ b/include/linux/tee_drv.h
-@@ -49,7 +49,6 @@ struct tee_shm_pool;
-  */
- struct tee_context {
- 	struct tee_device *teedev;
--	struct list_head list_shm;
- 	void *data;
- 	struct kref refcount;
- 	bool releasing;
-@@ -184,9 +183,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 con=
nection_method,
-=20
- /**
-  * struct tee_shm - shared memory object
-- * @teedev:	device used to allocate the object
-- * @ctx:	context using the object, if NULL the context is gone
-- * @link	link element
-+ * @ctx:	context using the object
-  * @paddr:	physical address of the shared memory
-  * @kaddr:	virtual address of the shared memory
-  * @size:	size of shared memory
-@@ -195,15 +192,17 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 c=
onnection_method,
-  * @num_pages:	number of locked pages
-  * @dmabuf:	dmabuf used to for exporting to user space
-  * @flags:	defined by TEE_SHM_* in tee_drv.h
-- * @id:		unique id of a shared memory object on this device
-+ * @id:		unique id of a shared memory object on this device, shared
-+ *		with user space
-+ * @sec_world_id:
-+ *		secure world assigned id of this shared memory object, not
-+ *		used by all drivers
-  *
-  * This pool is only supposed to be accessed directly from the TEE
-  * subsystem and from drivers that implements their own shm pool manager.
-  */
- struct tee_shm {
--	struct tee_device *teedev;
- 	struct tee_context *ctx;
--	struct list_head link;
- 	phys_addr_t paddr;
- 	void *kaddr;
- 	size_t size;
-@@ -213,6 +212,7 @@ struct tee_shm {
- 	struct dma_buf *dmabuf;
- 	u32 flags;
- 	int id;
-+	u64 sec_world_id;
- };
-=20
- /**
-@@ -334,18 +334,6 @@ void *tee_get_drvdata(struct tee_device *teedev);
-  */
- struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 f=
lags);
-=20
--/**
-- * tee_shm_priv_alloc() - Allocate shared memory privately
-- * @dev:	Device that allocates the shared memory
-- * @size:	Requested size of shared memory
-- *
-- * Allocates shared memory buffer that is not associated with any client
-- * context. Such buffers are owned by TEE driver and used for internal ca=
lls.
-- *
-- * @returns a pointer to 'struct tee_shm'
-- */
--struct tee_shm *tee_shm_priv_alloc(struct tee_device *teedev, size_t size=
);
--
- /**
-  * tee_shm_register() - Register shared memory buffer
-  * @ctx:	Context that registers the shared memory
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0013=
-tee-optee-fix-mem-handle-removal-in-ffa_shm_unregist.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0013-tee-optee-fix-mem-handle-=
removal-in-ffa_shm_unregist.patch
deleted file mode 100644
index ad2c945..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0013-tee-op=
tee-fix-mem-handle-removal-in-ffa_shm_unregist.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 957e0145899813017a6a2b7f863a4a2b4e4b75aa Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Tue, 5 Jan 2021 09:27:41 +0000
-Subject: [PATCH] tee: optee: fix mem handle removal in ffa_shm_unregister
-
-Remove ffa memory handle before calling mem_reclaim. This enables the
-handle to be re-used by another thread once mem_claim for that handle
-is completed.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I7294bd71f2bbc28514eaa09ae757dd216bc7df45
-
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- drivers/tee/optee/call.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index ac89ab42a43f..9c9480add0b5 100644
---- a/drivers/tee/optee/call.c
-+++ b/drivers/tee/optee/call.c
-@@ -843,6 +843,10 @@ int optee_ffa_shm_unregister_supp(struct tee_context =
*ctx,
- {
- 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
- 	int rc =3D 0;
-+	u64 handle =3D shm->sec_world_id;
-+
-+	optee_shm_rem_ffa_handle(optee, handle);
-+	shm->sec_world_id =3D 0;
-=20
- 	/*
- 	 * We're skipping the OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM call
-@@ -850,14 +854,10 @@ int optee_ffa_shm_unregister_supp(struct tee_context=
 *ctx,
- 	 * this ID.
- 	 */
-=20
--	rc =3D optee->ffa.ops->mem_reclaim(shm->sec_world_id, 0);
-+	rc =3D optee->ffa.ops->mem_reclaim(handle, 0);
- 	if (rc)
- 		pr_err("mem_reclain: %d", rc);
-=20
--	optee_shm_rem_ffa_handle(optee, shm->sec_world_id);
--
--	shm->sec_world_id =3D 0;
--
- 	return rc;
- }
- #endif /*CONFIG_ARM_FFA_TRANSPORT*/
---=20
-2.26.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0014=
-arm64-Add-support-for-asymmetric-AArch32-EL0-configu.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0014-arm64-Add-support-for-asy=
mmetric-AArch32-EL0-configu.patch
deleted file mode 100644
index 7ca9c07..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0014-arm64-=
Add-support-for-asymmetric-AArch32-EL0-configu.patch
+++ /dev/null
@@ -1,462 +0,0 @@
-Upstream-Status: Backport [http://www.linux-arm.org/git?p=3Dlinux-power.gi=
t;a=3Dcommit;h=3Dce7d6e205568b7949ff26f2b3c65dc4db1c15b96]
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-
-From 0316669bc2a0e1279427b7a3ed01313b70544756 Mon Sep 17 00:00:00 2001
-From: Catalin Marinas <catalin.marinas@arm.com>
-Date: Thu, 20 Jun 2019 17:59:25 +0100
-Subject: [PATCH 1/2] arm64: Add support for asymmetric AArch32 EL0
- configurations
-
-There is a non-negligible chance that we may see asymmetric big.LITTLE
-configurations where only the LITTLE CPUs have AArch32 support at EL0.
-While Linux currently handles such configurations by not allowing
-AArch32 tasks, there is a strong marketing push to investigate the
-possibility of allowing compat applications. This patch is aimed to
-facilitate internal testing and NOT FOR UPSTREAM.
-
-When the CONFIG_ASYMMETRIC_AARCH32 option is enabled (EXPERT), the type
-of the ARM64_HAS_32BIT_EL0 capability becomes WEAK_LOCAL_CPU_FEATURE.
-The kernel will now return true for system_supports_32bit_el0() and
-32-bit tasks will be migrated to the capable CPUs during
-do_notify_resume(). If the last CPU supporting 32-bit is offlined, the
-kernel will SIGKILL any scheduled 32-bit tasks (the alternative is to
-prevent offlining through a new .cpu_disable feature entry).
-
-In addition to the relaxation of the ARM64_HAS_32BIT_EL0 capability,
-this patch factors out the 32-bit cpuinfo and features setting into
-separate functions: __cpuinfo_store_cpu_32bit(),
-init_cpu_32bit_features(). The cpuinfo of the booting CPU
-(boot_cpu_data) is now updated on the first 32-bit capable CPU even if
-it is a secondary one. The ID_AA64PFR0_EL0_64BIT_ONLY feature is relaxed
-to FTR_NONSTRICT and FTR_HIGHER_SAFE when the asymmetric AArch32 support
-is enabled. The compat_elf_hwcaps are only verified for the
-AArch32-capable CPUs to still allow hotplugging AArch64-only CPUs.
-
-Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
-Cc: Morten Rasmussen <Morten.Rasmussen@arm.com>
-Cc: Valentin Schneider <valentin.schneider@arm.com>
-Cc: Qais Yousef <qais.yousef@arm.com>
-Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
-Signed-off-by: Qais Yousef <qais.yousef@arm.com>
----
- arch/arm64/Kconfig                   | 13 ++++++
- arch/arm64/include/asm/cpu.h         |  2 +
- arch/arm64/include/asm/cpufeature.h  |  3 ++
- arch/arm64/include/asm/thread_info.h |  5 ++-
- arch/arm64/kernel/cpufeature.c       | 64 ++++++++++++++++++----------
- arch/arm64/kernel/cpuinfo.c          | 61 +++++++++++++++++---------
- arch/arm64/kernel/process.c          | 17 ++++++++
- arch/arm64/kernel/signal.c           | 30 ++++++++++++-
- 8 files changed, 150 insertions(+), 45 deletions(-)
-
-diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
-index 71d23b5d10d4..068e9e9ffc40 100644
---- a/arch/arm64/Kconfig
-+++ b/arch/arm64/Kconfig
-@@ -1680,6 +1680,19 @@ config DMI
-=20
- endmenu
-=20
-+config ASYMMETRIC_AARCH32
-+	bool "Allow support for asymmetric AArch32 support"
-+	depends on COMPAT && EXPERT && !KVM
-+	help
-+	  Enable this option to allow support for asymmetric AArch32 EL0
-+	  CPU configurations. Once the AArch32 EL0 support is detected
-+	  on a CPU, the feature is made available to user space to allow
-+	  the execution of 32-bit (compat) applications by migrating
-+	  them to the capable CPUs. Offlining such CPUs leads to 32-bit
-+	  applications being killed.
-+
-+	  If unsure say N.
-+
- config SYSVIPC_COMPAT
- 	def_bool y
- 	depends on COMPAT && SYSVIPC
-diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
-index d72d995b7e25..39dbf5827070 100644
---- a/arch/arm64/include/asm/cpu.h
-+++ b/arch/arm64/include/asm/cpu.h
-@@ -15,6 +15,7 @@
- struct cpuinfo_arm64 {
- 	struct cpu	cpu;
- 	struct kobject	kobj;
-+	bool		aarch32_valid;
- 	u32		reg_ctr;
- 	u32		reg_cntfrq;
- 	u32		reg_dczid;
-@@ -60,6 +61,7 @@ void cpuinfo_store_cpu(void);
- void __init cpuinfo_store_boot_cpu(void);
-=20
- void __init init_cpu_features(struct cpuinfo_arm64 *info);
-+void init_cpu_32bit_features(struct cpuinfo_arm64 *info);
- void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
- 				 struct cpuinfo_arm64 *boot);
-=20
-diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/=
cpufeature.h
-index 9cde5d2e768f..d00d673d423b 100644
---- a/arch/arm64/include/asm/cpufeature.h
-+++ b/arch/arm64/include/asm/cpufeature.h
-@@ -17,6 +17,7 @@
- #ifndef __ASSEMBLY__
-=20
- #include <linux/bug.h>
-+#include <linux/cpumask.h>
- #include <linux/jump_label.h>
- #include <linux/kernel.h>
-=20
-@@ -370,6 +371,8 @@ cpucap_multi_entry_cap_matches(const struct arm64_cpu_=
capabilities *entry,
- 	return false;
- }
-=20
-+extern cpumask_t aarch32_el0_mask;
-+
- extern DECLARE_BITMAP(cpu_hwcaps, ARM64_NCAPS);
- extern struct static_key_false cpu_hwcap_keys[ARM64_NCAPS];
- extern struct static_key_false arm64_const_caps_ready;
-diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm=
/thread_info.h
-index 8c73764b9ed2..54a4c912a7ab 100644
---- a/arch/arm64/include/asm/thread_info.h
-+++ b/arch/arm64/include/asm/thread_info.h
-@@ -66,6 +66,7 @@ void arch_release_task_struct(struct task_struct *tsk);
- #define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
- #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
- #define TIF_FSCHECK		5	/* Check FS is USER_DS on return */
-+#define TIF_SET_32BIT_AFFINITY	6	/* set thread affinity for asymmetric AA=
rch32 */
- #define TIF_NOHZ		7
- #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
- #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
-@@ -95,11 +96,13 @@ void arch_release_task_struct(struct task_struct *tsk)=
;
- #define _TIF_UPROBE		(1 << TIF_UPROBE)
- #define _TIF_FSCHECK		(1 << TIF_FSCHECK)
- #define _TIF_32BIT		(1 << TIF_32BIT)
-+#define _TIF_SET_32BIT_AFFINITY	(1 << TIF_SET_32BIT_AFFINITY)
- #define _TIF_SVE		(1 << TIF_SVE)
-=20
- #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
- 				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
--				 _TIF_UPROBE | _TIF_FSCHECK)
-+				 _TIF_UPROBE | _TIF_FSCHECK | \
-+				 _TIF_SET_32BIT_AFFINITY)
-=20
- #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
- 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
-diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature=
.c
-index da92693b202c..c0d656cfe5b8 100644
---- a/arch/arm64/kernel/cpufeature.c
-+++ b/arch/arm64/kernel/cpufeature.c
-@@ -8,7 +8,6 @@
- #define pr_fmt(fmt) "CPU features: " fmt
-=20
- #include <linux/bsearch.h>
--#include <linux/cpumask.h>
- #include <linux/crash_dump.h>
- #include <linux/sort.h>
- #include <linux/stop_machine.h>
-@@ -164,7 +163,11 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] =
=3D {
- 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL=
3_SHIFT, 4, 0),
- 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL2_S=
HIFT, 4, 0),
- 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_S=
HIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
-+#ifndef CONFIG_ASYMMETRIC_AARCH32
- 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL0_S=
HIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
-+#else
-+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_HIGHER_SAFE, ID_AA64PFR0_E=
L0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
-+#endif
- 	ARM64_FTR_END,
- };
-=20
-@@ -509,7 +512,7 @@ static void __init sort_ftr_regs(void)
-  * Any bits that are not covered by an arm64_ftr_bits entry are considere=
d
-  * RES0 for the system-wide value, and must strictly match.
-  */
--static void __init init_cpu_ftr_reg(u32 sys_reg, u64 new)
-+static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
- {
- 	u64 val =3D 0;
- 	u64 strict_mask =3D ~0x0ULL;
-@@ -590,25 +593,6 @@ void __init init_cpu_features(struct cpuinfo_arm64 *i=
nfo)
- 	init_cpu_ftr_reg(SYS_ID_AA64PFR1_EL1, info->reg_id_aa64pfr1);
- 	init_cpu_ftr_reg(SYS_ID_AA64ZFR0_EL1, info->reg_id_aa64zfr0);
-=20
--	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
--		init_cpu_ftr_reg(SYS_ID_DFR0_EL1, info->reg_id_dfr0);
--		init_cpu_ftr_reg(SYS_ID_ISAR0_EL1, info->reg_id_isar0);
--		init_cpu_ftr_reg(SYS_ID_ISAR1_EL1, info->reg_id_isar1);
--		init_cpu_ftr_reg(SYS_ID_ISAR2_EL1, info->reg_id_isar2);
--		init_cpu_ftr_reg(SYS_ID_ISAR3_EL1, info->reg_id_isar3);
--		init_cpu_ftr_reg(SYS_ID_ISAR4_EL1, info->reg_id_isar4);
--		init_cpu_ftr_reg(SYS_ID_ISAR5_EL1, info->reg_id_isar5);
--		init_cpu_ftr_reg(SYS_ID_MMFR0_EL1, info->reg_id_mmfr0);
--		init_cpu_ftr_reg(SYS_ID_MMFR1_EL1, info->reg_id_mmfr1);
--		init_cpu_ftr_reg(SYS_ID_MMFR2_EL1, info->reg_id_mmfr2);
--		init_cpu_ftr_reg(SYS_ID_MMFR3_EL1, info->reg_id_mmfr3);
--		init_cpu_ftr_reg(SYS_ID_PFR0_EL1, info->reg_id_pfr0);
--		init_cpu_ftr_reg(SYS_ID_PFR1_EL1, info->reg_id_pfr1);
--		init_cpu_ftr_reg(SYS_MVFR0_EL1, info->reg_mvfr0);
--		init_cpu_ftr_reg(SYS_MVFR1_EL1, info->reg_mvfr1);
--		init_cpu_ftr_reg(SYS_MVFR2_EL1, info->reg_mvfr2);
--	}
--
- 	if (id_aa64pfr0_sve(info->reg_id_aa64pfr0)) {
- 		init_cpu_ftr_reg(SYS_ZCR_EL1, info->reg_zcr);
- 		sve_init_vq_map();
-@@ -627,6 +611,26 @@ void __init init_cpu_features(struct cpuinfo_arm64 *i=
nfo)
- 	setup_boot_cpu_capabilities();
- }
-=20
-+void init_cpu_32bit_features(struct cpuinfo_arm64 *info)
-+{
-+	init_cpu_ftr_reg(SYS_ID_DFR0_EL1, info->reg_id_dfr0);
-+	init_cpu_ftr_reg(SYS_ID_ISAR0_EL1, info->reg_id_isar0);
-+	init_cpu_ftr_reg(SYS_ID_ISAR1_EL1, info->reg_id_isar1);
-+	init_cpu_ftr_reg(SYS_ID_ISAR2_EL1, info->reg_id_isar2);
-+	init_cpu_ftr_reg(SYS_ID_ISAR3_EL1, info->reg_id_isar3);
-+	init_cpu_ftr_reg(SYS_ID_ISAR4_EL1, info->reg_id_isar4);
-+	init_cpu_ftr_reg(SYS_ID_ISAR5_EL1, info->reg_id_isar5);
-+	init_cpu_ftr_reg(SYS_ID_MMFR0_EL1, info->reg_id_mmfr0);
-+	init_cpu_ftr_reg(SYS_ID_MMFR1_EL1, info->reg_id_mmfr1);
-+	init_cpu_ftr_reg(SYS_ID_MMFR2_EL1, info->reg_id_mmfr2);
-+	init_cpu_ftr_reg(SYS_ID_MMFR3_EL1, info->reg_id_mmfr3);
-+	init_cpu_ftr_reg(SYS_ID_PFR0_EL1, info->reg_id_pfr0);
-+	init_cpu_ftr_reg(SYS_ID_PFR1_EL1, info->reg_id_pfr1);
-+	init_cpu_ftr_reg(SYS_MVFR0_EL1, info->reg_mvfr0);
-+	init_cpu_ftr_reg(SYS_MVFR1_EL1, info->reg_mvfr1);
-+	init_cpu_ftr_reg(SYS_MVFR2_EL1, info->reg_mvfr2);
-+}
-+
- static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
- {
- 	const struct arm64_ftr_bits *ftrp;
-@@ -1264,6 +1268,16 @@ static bool can_use_gic_priorities(const struct arm=
64_cpu_capabilities *entry,
- }
- #endif
-=20
-+#ifdef CONFIG_ASYMMETRIC_AARCH32
-+cpumask_t aarch32_el0_mask;
-+
-+static void cpu_enable_aarch32_el0(struct arm64_cpu_capabilities const *c=
ap)
-+{
-+	if (has_cpuid_feature(cap, SCOPE_LOCAL_CPU))
-+		cpumask_set_cpu(smp_processor_id(), &aarch32_el0_mask);
-+}
-+#endif
-+
- static const struct arm64_cpu_capabilities arm64_features[] =3D {
- 	{
- 		.desc =3D "GIC system register CPU interface",
-@@ -1340,7 +1354,12 @@ static const struct arm64_cpu_capabilities arm64_fe=
atures[] =3D {
- 	{
- 		.desc =3D "32-bit EL0 Support",
- 		.capability =3D ARM64_HAS_32BIT_EL0,
-+#ifndef CONFIG_ASYMMETRIC_AARCH32
- 		.type =3D ARM64_CPUCAP_SYSTEM_FEATURE,
-+#else
-+		.type =3D ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
-+		.cpu_enable =3D cpu_enable_aarch32_el0,
-+#endif
- 		.matches =3D has_cpuid_feature,
- 		.sys_reg =3D SYS_ID_AA64PFR0_EL1,
- 		.sign =3D FTR_UNSIGNED,
-@@ -1983,7 +2002,8 @@ static void verify_local_cpu_capabilities(void)
-=20
- 	verify_local_elf_hwcaps(arm64_elf_hwcaps);
-=20
--	if (system_supports_32bit_el0())
-+	if (system_supports_32bit_el0() &&
-+	    this_cpu_has_cap(ARM64_HAS_32BIT_EL0))
- 		verify_local_elf_hwcaps(compat_elf_hwcaps);
-=20
- 	if (system_supports_sve())
-diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
-index 05933c065732..bda37687bb66 100644
---- a/arch/arm64/kernel/cpuinfo.c
-+++ b/arch/arm64/kernel/cpuinfo.c
-@@ -351,27 +351,6 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 =
*info)
- 	info->reg_id_aa64pfr1 =3D read_cpuid(ID_AA64PFR1_EL1);
- 	info->reg_id_aa64zfr0 =3D read_cpuid(ID_AA64ZFR0_EL1);
-=20
--	/* Update the 32bit ID registers only if AArch32 is implemented */
--	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
--		info->reg_id_dfr0 =3D read_cpuid(ID_DFR0_EL1);
--		info->reg_id_isar0 =3D read_cpuid(ID_ISAR0_EL1);
--		info->reg_id_isar1 =3D read_cpuid(ID_ISAR1_EL1);
--		info->reg_id_isar2 =3D read_cpuid(ID_ISAR2_EL1);
--		info->reg_id_isar3 =3D read_cpuid(ID_ISAR3_EL1);
--		info->reg_id_isar4 =3D read_cpuid(ID_ISAR4_EL1);
--		info->reg_id_isar5 =3D read_cpuid(ID_ISAR5_EL1);
--		info->reg_id_mmfr0 =3D read_cpuid(ID_MMFR0_EL1);
--		info->reg_id_mmfr1 =3D read_cpuid(ID_MMFR1_EL1);
--		info->reg_id_mmfr2 =3D read_cpuid(ID_MMFR2_EL1);
--		info->reg_id_mmfr3 =3D read_cpuid(ID_MMFR3_EL1);
--		info->reg_id_pfr0 =3D read_cpuid(ID_PFR0_EL1);
--		info->reg_id_pfr1 =3D read_cpuid(ID_PFR1_EL1);
--
--		info->reg_mvfr0 =3D read_cpuid(MVFR0_EL1);
--		info->reg_mvfr1 =3D read_cpuid(MVFR1_EL1);
--		info->reg_mvfr2 =3D read_cpuid(MVFR2_EL1);
--	}
--
- 	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
- 	    id_aa64pfr0_sve(info->reg_id_aa64pfr0))
- 		info->reg_zcr =3D read_zcr_features();
-@@ -379,10 +358,46 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64=
 *info)
- 	cpuinfo_detect_icache_policy(info);
- }
-=20
-+static void __cpuinfo_store_cpu_32bit(struct cpuinfo_arm64 *info)
-+{
-+	info->aarch32_valid =3D true;
-+
-+	info->reg_id_dfr0 =3D read_cpuid(ID_DFR0_EL1);
-+	info->reg_id_isar0 =3D read_cpuid(ID_ISAR0_EL1);
-+	info->reg_id_isar1 =3D read_cpuid(ID_ISAR1_EL1);
-+	info->reg_id_isar2 =3D read_cpuid(ID_ISAR2_EL1);
-+	info->reg_id_isar3 =3D read_cpuid(ID_ISAR3_EL1);
-+	info->reg_id_isar4 =3D read_cpuid(ID_ISAR4_EL1);
-+	info->reg_id_isar5 =3D read_cpuid(ID_ISAR5_EL1);
-+	info->reg_id_mmfr0 =3D read_cpuid(ID_MMFR0_EL1);
-+	info->reg_id_mmfr1 =3D read_cpuid(ID_MMFR1_EL1);
-+	info->reg_id_mmfr2 =3D read_cpuid(ID_MMFR2_EL1);
-+	info->reg_id_mmfr3 =3D read_cpuid(ID_MMFR3_EL1);
-+	info->reg_id_pfr0 =3D read_cpuid(ID_PFR0_EL1);
-+	info->reg_id_pfr1 =3D read_cpuid(ID_PFR1_EL1);
-+
-+	info->reg_mvfr0 =3D read_cpuid(MVFR0_EL1);
-+	info->reg_mvfr1 =3D read_cpuid(MVFR1_EL1);
-+	info->reg_mvfr2 =3D read_cpuid(MVFR2_EL1);
-+}
-+
- void cpuinfo_store_cpu(void)
- {
- 	struct cpuinfo_arm64 *info =3D this_cpu_ptr(&cpu_data);
- 	__cpuinfo_store_cpu(info);
-+	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
-+		__cpuinfo_store_cpu_32bit(info);
-+	/*
-+	 * With asymmetric AArch32 support, populate the boot CPU information
-+	 * on the first 32-bit capable secondary CPU if the primary one
-+	 * skipped this step.
-+	 */
-+	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) &&
-+	    !boot_cpu_data.aarch32_valid &&
-+	    id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
-+		__cpuinfo_store_cpu_32bit(&boot_cpu_data);
-+		init_cpu_32bit_features(&boot_cpu_data);
-+	}
- 	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
- }
-=20
-@@ -390,9 +405,13 @@ void __init cpuinfo_store_boot_cpu(void)
- {
- 	struct cpuinfo_arm64 *info =3D &per_cpu(cpu_data, 0);
- 	__cpuinfo_store_cpu(info);
-+	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
-+		__cpuinfo_store_cpu_32bit(info);
-=20
- 	boot_cpu_data =3D *info;
- 	init_cpu_features(&boot_cpu_data);
-+	if (id_aa64pfr0_32bit_el0(boot_cpu_data.reg_id_aa64pfr0))
-+		init_cpu_32bit_features(&boot_cpu_data);
- }
-=20
- device_initcall(cpuinfo_regs_init);
-diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
-index cc1d8b1025b1..35f0c93699ce 100644
---- a/arch/arm64/kernel/process.c
-+++ b/arch/arm64/kernel/process.c
-@@ -494,6 +494,15 @@ static void entry_task_switch(struct task_struct *nex=
t)
- 	__this_cpu_write(__entry_task, next);
- }
-=20
-+static void aarch32_thread_switch(struct task_struct *next)
-+{
-+	struct thread_info *ti =3D task_thread_info(next);
-+
-+	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) && is_compat_thread(ti) &&
-+	    !cpumask_test_cpu(smp_processor_id(), &aarch32_el0_mask))
-+		set_ti_thread_flag(ti, TIF_SET_32BIT_AFFINITY);
-+}
-+
- /*
-  * Thread switching.
-  */
-@@ -511,6 +520,7 @@ __notrace_funcgraph struct task_struct *__switch_to(st=
ruct task_struct *prev,
- 	ptrauth_thread_switch(next);
- 	ssbs_thread_switch(next);
- 	scs_overflow_check(next);
-+	aarch32_thread_switch(next);
-=20
- 	/*
- 	 * Complete any pending TLB or cache maintenance on this CPU in case
-@@ -569,6 +579,13 @@ void arch_setup_new_exec(void)
- 	current->mm->context.flags =3D is_compat_task() ? MMCF_AARCH32 : 0;
-=20
- 	ptrauth_thread_init_user(current);
-+
-+	/*
-+	 * If exec'ing a 32-bit task, force the asymmetric 32-bit feature
-+	 * check as the task may not go through a switch_to() call.
-+	 */
-+	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) && is_compat_task())
-+		set_thread_flag(TIF_SET_32BIT_AFFINITY);
- }
-=20
- #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
-diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
-index dd2cdc0d5be2..d8cdd3211d68 100644
---- a/arch/arm64/kernel/signal.c
-+++ b/arch/arm64/kernel/signal.c
-@@ -8,6 +8,7 @@
-=20
- #include <linux/cache.h>
- #include <linux/compat.h>
-+#include <linux/cpumask.h>
- #include <linux/errno.h>
- #include <linux/kernel.h>
- #include <linux/signal.h>
-@@ -896,6 +897,29 @@ static void do_signal(struct pt_regs *regs)
- 	restore_saved_sigmask();
- }
-=20
-+static void set_32bit_cpus_allowed(void)
-+{
-+	int ret;
-+
-+	/*
-+	 * Try to honour as best as possible whatever affinity request this
-+	 * task has. If it spans no compatible CPU, disregard it entirely.
-+	 */
-+	if (cpumask_intersects(current->cpus_ptr, &aarch32_el0_mask)) {
-+		cpumask_t cpus_allowed;
-+
-+		cpumask_and(&cpus_allowed, current->cpus_ptr, &aarch32_el0_mask);
-+		ret =3D set_cpus_allowed_ptr(current, &cpus_allowed);
-+	} else {
-+		ret =3D set_cpus_allowed_ptr(current, &aarch32_el0_mask);
-+	}
-+
-+	if (ret) {
-+		pr_warn_once("No CPUs capable of running 32-bit tasks\n");
-+		force_sig(SIGKILL);
-+	}
-+}
-+
- asmlinkage void do_notify_resume(struct pt_regs *regs,
- 				 unsigned long thread_flags)
- {
-@@ -910,7 +934,11 @@ asmlinkage void do_notify_resume(struct pt_regs *regs=
,
- 		/* Check valid user FS if needed */
- 		addr_limit_user_check();
-=20
--		if (thread_flags & _TIF_NEED_RESCHED) {
-+		if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) &&
-+		    thread_flags & _TIF_SET_32BIT_AFFINITY) {
-+			clear_thread_flag(TIF_SET_32BIT_AFFINITY);
-+			set_32bit_cpus_allowed();
-+		} else if (thread_flags & _TIF_NEED_RESCHED) {
- 			/* Unmask Debug and SError for the next task */
- 			local_daif_restore(DAIF_PROCCTX_NOIRQ);
-=20
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0015=
-arm64-smp-Prevent-hotplugging-the-last-AArch32-able-.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0015-arm64-smp-Prevent-hotplug=
ging-the-last-AArch32-able-.patch
deleted file mode 100644
index 774721e..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0015-arm64-=
smp-Prevent-hotplugging-the-last-AArch32-able-.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-Upstream-Status: Backport [http://www.linux-arm.org/git?p=3Dlinux-power.gi=
t;a=3Dcommit;h=3De6b567c1cc07dd1690e5d34b6a93ab9819ab2eeb]
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-
-From d6acb605de7d40c295ada9b1f4c8336e4db71ae4 Mon Sep 17 00:00:00 2001
-From: Valentin Schneider <valentin.schneider@arm.com>
-Date: Thu, 5 Sep 2019 17:53:19 +0100
-Subject: [PATCH 2/2] arm64: smp: Prevent hotplugging the last AArch32-able=
 CPU
-
-EL0 AArch32 tasks are now sigkilled when they can't run on any
-compatible CPU, either because there aren't any left (hotplug) or
-because they aren't allowed to run on those left (task affinity).
-
-However, it has been deemed valuable to prevent the loss of
-functionality resulting in offlining the last AArch32-compatible CPU.
-
-Add arch-specific hook in _cpu_down() that allows checking whether we
-can offline a cpu or not and use that hook to veto offlining the last
-AArch32 CPU.
-
-Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
-Signed-off-by: Qais Yousef <qais.yousef@arm.com>
----
- arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
- kernel/cpu.c            |  9 +++++++++
- 2 files changed, 31 insertions(+)
-
-diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
-index 038ce6263d1c..c8ab4ee29f32 100644
---- a/arch/arm64/kernel/smp.c
-+++ b/arch/arm64/kernel/smp.c
-@@ -85,6 +85,28 @@ static inline int op_cpu_kill(unsigned int cpu)
- }
- #endif
-=20
-+bool arch_allows_cpu_disable(int cpu, int tasks_frozen,
-+			     enum cpuhp_state target)
-+{
-+	/*
-+	 * Don't let the last AArch32-compatible CPU go down unless the request
-+	 * is related to suspend (!tasks_frozen) then allow it to be offlined
-+	 * or we'll break suspend-to-ram functionality.
-+	 */
-+	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) &&
-+	    !cpumask_empty(&aarch32_el0_mask) &&
-+	    !tasks_frozen) {
-+		cpumask_t online;
-+
-+		cpumask_and(&online, &aarch32_el0_mask, cpu_online_mask);
-+
-+		if (cpumask_weight(&online) =3D=3D 1)
-+			return false;
-+	}
-+
-+	return true;
-+}
-+
-=20
- /*
-  * Boot a secondary CPU, and assign it the specified idle task.
-diff --git a/kernel/cpu.c b/kernel/cpu.c
-index 261b5098f81c..4fae9b61f442 100644
---- a/kernel/cpu.c
-+++ b/kernel/cpu.c
-@@ -134,6 +134,12 @@ static struct cpuhp_step *cpuhp_get_step(enum cpuhp_s=
tate state)
- 	return cpuhp_hp_states + state;
- }
-=20
-+bool __weak arch_allows_cpu_disable(int cpu, int tasks_frozen,
-+				    enum cpuhp_state target)
-+{
-+	return true;
-+}
-+
- /**
-  * cpuhp_invoke_callback _ Invoke the callbacks for a given state
-  * @cpu:	The cpu for which the callback should be invoked
-@@ -985,6 +991,9 @@ static int __ref _cpu_down(unsigned int cpu, int tasks=
_frozen,
- 	if (!cpu_present(cpu))
- 		return -EINVAL;
-=20
-+	if (!arch_allows_cpu_disable(cpu, tasks_frozen, target))
-+		return -EBUSY;
-+
- 	cpus_write_lock();
-=20
- 	cpuhp_tasks_frozen =3D tasks_frozen;
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend=
 b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappend
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc b/meta-arm/r=
ecipes-kernel/linux/linux-arm64-ack.inc
index a9d561b..261e08b 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: Apache-2.0
 #
-# Copyright (c) 2020 Arm Limited
+# Copyright (c) 2021 Arm Limited
 #
=20
 DESCRIPTION =3D "Linux Android Common Kernel"
 SECTION =3D "kernel"
 LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://${S}/COPYING;md5=3Dbbea815ee2795b2f4230826c0c=
6b8814"
+LIC_FILES_CHKSUM =3D "file://${S}/COPYING;md5=3D6bc538ed5bd9a7fc9398086aed=
cd7e46"
=20
 require recipes-kernel/linux/linux-yocto.inc
=20
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-perf-cs-etm=
-Move-definition-of-traceid_list-global-v.patch b/meta-arm/recipes-kernel/l=
inux/linux-arm64-ack/0001-perf-cs-etm-Move-definition-of-traceid_list-globa=
l-v.patch
deleted file mode 100644
index 94ab435..0000000
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0001-perf-cs-etm-Move-d=
efinition-of-traceid_list-global-v.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 28c69b683210b5d5321ceb71e44a77bc31a32c8a Mon Sep 17 00:00:00 2001
-From: Leo Yan <leo.yan@linaro.org>
-Date: Tue, 5 May 2020 21:36:42 +0800
-Subject: [PATCH 1/4] perf cs-etm: Move definition of 'traceid_list' global
- variable from header file
-
-The variable 'traceid_list' is defined in the header file cs-etm.h,
-if multiple C files include cs-etm.h the compiler might complaint for
-multiple definition of 'traceid_list'.
-
-To fix multiple definition error, move the definition of 'traceid_list'
-into cs-etm.c.
-
-Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
-Reported-by: Thomas Backlund <tmb@mageia.org>
-Signed-off-by: Leo Yan <leo.yan@linaro.org>
-Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
-Reviewed-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Thomas Backlund <tmb@mageia.org>
-Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
-Cc: Jiri Olsa <jolsa@redhat.com>
-Cc: Mark Rutland <mark.rutland@arm.com>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
-Cc: Tor Jeremiassen <tor@ti.com>
-Cc: linux-arm-kernel@lists.infradead.org
-Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.org
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/util/cs-etm.c | 3 +++
- tools/perf/util/cs-etm.h | 3 ---
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
-index f5f855fff412..50de6a1ed0ce 100644
---- a/tools/perf/util/cs-etm.c
-+++ b/tools/perf/util/cs-etm.c
-@@ -94,6 +94,9 @@ struct cs_etm_queue {
- 	struct cs_etm_traceid_queue **traceid_queues;
- };
-=20
-+/* RB tree for quick conversion between traceID and metadata pointers */
-+static struct intlist *traceid_list;
-+
- static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
-diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
-index 650ecc2a6349..4ad925d6d799 100644
---- a/tools/perf/util/cs-etm.h
-+++ b/tools/perf/util/cs-etm.h
-@@ -114,9 +114,6 @@ enum cs_etm_isa {
- 	CS_ETM_ISA_T32,
- };
-=20
--/* RB tree for quick conversion between traceID and metadata pointers */
--struct intlist *traceid_list;
--
- struct cs_etm_queue;
-=20
- struct cs_etm_packet {
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0002-perf-tests-=
bp_account-Make-global-variable-static.patch b/meta-arm/recipes-kernel/linu=
x/linux-arm64-ack/0002-perf-tests-bp_account-Make-global-variable-static.pa=
tch
deleted file mode 100644
index 142d4b7..0000000
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0002-perf-tests-bp_acco=
unt-Make-global-variable-static.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b28dc646b4c5cd3844bd591af841494dd1de0a9f Mon Sep 17 00:00:00 2001
-From: Arnaldo Carvalho de Melo <acme@redhat.com>
-Date: Mon, 2 Mar 2020 11:13:19 -0300
-Subject: [PATCH 2/4] perf tests bp_account: Make global variable static
-
-To fix the build with newer gccs, that without this patch exit with:
-
-    LD       /tmp/build/perf/tests/perf-in.o
-  ld: /tmp/build/perf/tests/bp_account.o:/git/perf/tools/perf/tests/bp_acc=
ount.c:22: multiple definition of `the_var'; /tmp/build/perf/tests/bp_signa=
l.o:/git/perf/tools/perf/tests/bp_signal.c:38: first defined here
-  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/perf/=
tests/perf-in.o] Error 1
-
-First noticed in fedora:rawhide/32 with:
-
-  [perfbuilder@a5ff49d6e6e4 ~]$ gcc --version
-  gcc (GCC) 10.0.1 20200216 (Red Hat 10.0.1-0.8)
-
-Reported-by: Jiri Olsa <jolsa@kernel.org>
-Cc: Adrian Hunter <adrian.hunter@intel.com>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/tests/bp_account.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account.c
-index 016bba2c142d..55a9de311d7b 100644
---- a/tools/perf/tests/bp_account.c
-+++ b/tools/perf/tests/bp_account.c
-@@ -23,7 +23,7 @@
- #include "../perf-sys.h"
- #include "cloexec.h"
-=20
--volatile long the_var;
-+static volatile long the_var;
-=20
- static noinline int test_function(void)
- {
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0003-perf-bench-=
Share-some-global-variables-to-fix-build-.patch b/meta-arm/recipes-kernel/l=
inux/linux-arm64-ack/0003-perf-bench-Share-some-global-variables-to-fix-bui=
ld-.patch
deleted file mode 100644
index 965cc38..0000000
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0003-perf-bench-Share-s=
ome-global-variables-to-fix-build-.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From e6ae6031755b6781af42af28f11186bb18e94842 Mon Sep 17 00:00:00 2001
-From: Arnaldo Carvalho de Melo <acme@redhat.com>
-Date: Mon, 2 Mar 2020 12:09:38 -0300
-Subject: [PATCH 3/4] perf bench: Share some global variables to fix build =
with
- gcc 10
-
-Noticed with gcc 10 (fedora rawhide) that those variables were not being
-declared as static, so end up with:
-
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-=
wait.c:93: multiple definition of `end'; /tmp/build/perf/bench/futex-hash.o=
:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-=
wait.c:93: multiple definition of `start'; /tmp/build/perf/bench/futex-hash=
.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epoll-=
wait.c:93: multiple definition of `runtime'; /tmp/build/perf/bench/futex-ha=
sh.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-c=
tl.c:38: multiple definition of `end'; /tmp/build/perf/bench/futex-hash.o:/=
git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-c=
tl.c:38: multiple definition of `start'; /tmp/build/perf/bench/futex-hash.o=
:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll-c=
tl.c:38: multiple definition of `runtime'; /tmp/build/perf/bench/futex-hash=
.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/perf/=
bench/perf-in.o] Error 1
-
-Prefix those with bench__ and add them to bench/bench.h, so that we can
-share those on the tools needing to access those variables from signal
-handlers.
-
-Acked-by: Thomas Gleixner <tglx@linutronix.de>
-Cc: Adrian Hunter <adrian.hunter@intel.com>
-Cc: Davidlohr Bueso <dave@stgolabs.net>
-Cc: Jiri Olsa <jolsa@kernel.org>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Link: http://lore.kernel.org/lkml/20200303155811.GD13702@kernel.org
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/bench/bench.h         |  4 ++++
- tools/perf/bench/epoll-ctl.c     |  7 +++----
- tools/perf/bench/epoll-wait.c    | 11 +++++------
- tools/perf/bench/futex-hash.c    | 12 ++++++------
- tools/perf/bench/futex-lock-pi.c | 11 +++++------
- 5 files changed, 23 insertions(+), 22 deletions(-)
-
-diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
-index fddb3ced9db6..4aa6de1aa67d 100644
---- a/tools/perf/bench/bench.h
-+++ b/tools/perf/bench/bench.h
-@@ -2,6 +2,10 @@
- #ifndef BENCH_H
- #define BENCH_H
-=20
-+#include <sys/time.h>
-+
-+extern struct timeval bench__start, bench__end, bench__runtime;
-+
- /*
-  * The madvise transparent hugepage constants were added in glibc
-  * 2.13. For compatibility with older versions of glibc, define these
-diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
-index bb617e568841..a7526c05df38 100644
---- a/tools/perf/bench/epoll-ctl.c
-+++ b/tools/perf/bench/epoll-ctl.c
-@@ -35,7 +35,6 @@
-=20
- static unsigned int nthreads =3D 0;
- static unsigned int nsecs    =3D 8;
--struct timeval start, end, runtime;
- static bool done, __verbose, randomize;
-=20
- /*
-@@ -94,8 +93,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void nest_epollfd(void)
-@@ -361,7 +360,7 @@ int bench_epoll_ctl(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
-=20
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	do_threads(worker, cpu);
-=20
-diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait.c
-index 7af694437f4e..d1c5cb526b9f 100644
---- a/tools/perf/bench/epoll-wait.c
-+++ b/tools/perf/bench/epoll-wait.c
-@@ -90,7 +90,6 @@
-=20
- static unsigned int nthreads =3D 0;
- static unsigned int nsecs    =3D 8;
--struct timeval start, end, runtime;
- static bool wdone, done, __verbose, randomize, nonblocking;
-=20
- /*
-@@ -276,8 +275,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void print_summary(void)
-@@ -287,7 +286,7 @@ static void print_summary(void)
-=20
- 	printf("\nAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n",
- 	       avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
-@@ -479,7 +478,7 @@ int bench_epoll_wait(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
-=20
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	do_threads(worker, cpu);
-=20
-@@ -519,7 +518,7 @@ int bench_epoll_wait(int argc, const char **argv)
- 		qsort(worker, nthreads, sizeof(struct worker), cmpworker);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
-=20
- 		update_stats(&throughput_stats, t);
-=20
-diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
-index 8ba0c3330a9a..21776862e940 100644
---- a/tools/perf/bench/futex-hash.c
-+++ b/tools/perf/bench/futex-hash.c
-@@ -37,7 +37,7 @@ static unsigned int nfutexes =3D 1024;
- static bool fshared =3D false, done =3D false, silent =3D false;
- static int futex_flag =3D 0;
-=20
--struct timeval start, end, runtime;
-+struct timeval bench__start, bench__end, bench__runtime;
- static pthread_mutex_t thread_lock;
- static unsigned int threads_starting;
- static struct stats throughput_stats;
-@@ -103,8 +103,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void print_summary(void)
-@@ -114,7 +114,7 @@ static void print_summary(void)
-=20
- 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n",
- 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- int bench_futex_hash(int argc, const char **argv)
-@@ -161,7 +161,7 @@ int bench_futex_hash(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
- 	pthread_attr_init(&thread_attr);
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
- 	for (i =3D 0; i < nthreads; i++) {
- 		worker[i].tid =3D i;
- 		worker[i].futex =3D calloc(nfutexes, sizeof(*worker[i].futex));
-@@ -204,7 +204,7 @@ int bench_futex_hash(int argc, const char **argv)
- 	pthread_mutex_destroy(&thread_lock);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
- 		update_stats(&throughput_stats, t);
- 		if (!silent) {
- 			if (nfutexes =3D=3D 1)
-diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-loc=
k-pi.c
-index d0cae8125423..30d97121dc4f 100644
---- a/tools/perf/bench/futex-lock-pi.c
-+++ b/tools/perf/bench/futex-lock-pi.c
-@@ -37,7 +37,6 @@ static bool silent =3D false, multi =3D false;
- static bool done =3D false, fshared =3D false;
- static unsigned int nthreads =3D 0;
- static int futex_flag =3D 0;
--struct timeval start, end, runtime;
- static pthread_mutex_t thread_lock;
- static unsigned int threads_starting;
- static struct stats throughput_stats;
-@@ -64,7 +63,7 @@ static void print_summary(void)
-=20
- 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n",
- 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- static void toggle_done(int sig __maybe_unused,
-@@ -73,8 +72,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void *workerfn(void *arg)
-@@ -185,7 +184,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
- 	pthread_attr_init(&thread_attr);
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	create_threads(worker, thread_attr, cpu);
- 	pthread_attr_destroy(&thread_attr);
-@@ -211,7 +210,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
- 	pthread_mutex_destroy(&thread_lock);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
-=20
- 		update_stats(&throughput_stats, t);
- 		if (!silent)
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0004-libtraceeve=
nt-Fix-build-with-binutils-2.35.patch b/meta-arm/recipes-kernel/linux/linux=
-arm64-ack/0004-libtraceevent-Fix-build-with-binutils-2.35.patch
deleted file mode 100644
index 5e18157..0000000
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack/0004-libtraceevent-Fix-=
build-with-binutils-2.35.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From c2c2c58915def6cda401d1782048d23b2b02ed85 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Sat, 25 Jul 2020 02:06:23 +0100
-Subject: [PATCH 4/4] libtraceevent: Fix build with binutils 2.35
-
-In binutils 2.35, 'nm -D' changed to show symbol versions along with
-symbol names, with the usual @@ separator.  When generating
-libtraceevent-dynamic-list we need just the names, so strip off the
-version suffix if present.
-
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-Tested-by: Salvatore Bonaccorso <carnil@debian.org>
-Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
-Cc: linux-trace-devel@vger.kernel.org
-Cc: stable@vger.kernel.org
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/lib/traceevent/plugins/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/lib/traceevent/plugins/Makefile b/tools/lib/traceevent/=
plugins/Makefile
-index f440989fa55e..23c3535bcbd6 100644
---- a/tools/lib/traceevent/plugins/Makefile
-+++ b/tools/lib/traceevent/plugins/Makefile
-@@ -196,7 +196,7 @@ define do_generate_dynamic_list_file
- 	xargs echo "U w W" | tr 'w ' 'W\n' | sort -u | xargs echo`;\
- 	if [ "$$symbol_type" =3D "U W" ];then				\
- 		(echo '{';                                              \
--		$(NM) -u -D $1 | awk 'NF>1 {print "\t"$$2";"}' | sort -u;\
-+		$(NM) -u -D $1 | awk 'NF>1 {sub("@.*", "", $$2); print "\t"$$2";"}' | s=
ort -u;\
- 		echo '};';                                              \
- 		) > $2;                                                 \
- 	else                                                            \
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb b/meta-a=
rm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
new file mode 100644
index 0000000..e71bdd0
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: Apache-2.0
+#
+# Copyright (c) 2021 Arm Limited
+#
+require linux-arm64-ack.inc
+
+SRC_URI =3D " \
+    git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;bran=
ch=3Dandroid12-5.10-lts \
+    "
+
+# tag: ASB-2021-06-05_12-5.10
+SRCREV =3D "00dc4c64e6592a2e469f7886a6a927778c4a2806"
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb b/meta-ar=
m/recipes-kernel/linux/linux-arm64-ack_5.4.bb
deleted file mode 100644
index aab2fd1..0000000
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: Apache-2.0
-#
-# Copyright (c) 2020 Arm Limited
-#
-require linux-arm64-ack.inc
-
-SRC_URI =3D " \
-    git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;bran=
ch=3Dandroid11-5.4-lts \
-    file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch=
 \
-    file://0002-perf-tests-bp_account-Make-global-variable-static.patch \
-    file://0003-perf-bench-Share-some-global-variables-to-fix-build-.patch=
 \
-    file://0004-libtraceevent-Fix-build-with-binutils-2.35.patch \
-    "
-
-# ASB-2020-07-05_5.4-stable tag commit
-SRCREV =3D "056684c0d252f75c13be4abb7408f692eedab653"
--=20
2.29.2

