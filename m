Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CB1FA0C23
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:44:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7677.1776321850314551114
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 23:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UzBUO1zi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85663b5c25=kexin.hao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G54Tue2560579;
	Thu, 16 Apr 2026 06:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=bE/EmfvGR
	I3X2L4FW/7Rg+p2jWbUIHJ2R3Wqtaehnu0=; b=UzBUO1ziYjbTIPZe2gsx+5AkT
	EXw/bmRfs2Q0Q2ndShtIpyND05V6VIW1e4CV7p5uSjMd0Di9oHaT+FYuxWyG1Te0
	coAu8/Wo/14g66UI29LOFDgMFkSfDk8092Z1ewwtFUDDvV/NTmS89CweMacFoHqM
	3Pw0Ha2YMMGeg7LzyiDrTw0v+dYyjAE6OF8+iNaFiLqALJvZeSFncxgThBR3yQFg
	z4UbRqCmHHRiSvtE7nCsGAOlhhDUNFTcqUctY4KLk+grXbvrhLLEQwcAkVYL34CQ
	qF0JDZ9Q3pR7L3RVx+3y9j9EaFthoT/3L0p3o3ULgg8zmhcHnRpnFS8ZLVNdg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877k962-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 06:43:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oq/+EYGuHWcJvJ4wPO8n7tgLdwrmrBAuysycU7tuq3zxaLDfbUN32zTpITAI06yDAQHXZ6SCj8XY0QPunhd58grlz+o7l2pFPOrpAB9cNfkXMbTVoV/2JAN1+oKXh0sVFWM1oSMwn/tWGCvxPcTK6ChGjbv9WUhg9LIr+zGgPDTdmfIm8z2xbZ7UVjU+owA6mFO/6UbK1ywA+0sHfqEAzLEV//0Mf+BasdwSXG1pfas8SFA+7mxcKC7bBSjfgVp55UkPR2iWIHDtpNuCUhsr+FtV5e+VN8Ly4PgQz0wC+y5v6cSqk2GlRp6539QNb2o25B8BE76WKSUzv5uKLTUPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bE/EmfvGRI3X2L4FW/7Rg+p2jWbUIHJ2R3Wqtaehnu0=;
 b=lWYLg3YGc5PRO8FsX9DAttRLjabkrXiiuFqZXd3h0QBCTsvqOlyMwIsFhQF3IACjBZo2kkN/xyZq3QJFhn8QHi9EUdUs7ofPoSHuvVDruHe6DssIzvhK10KUCMqyZpGUCSm1cGHK9Wr1AKS+gJxlIPMBKvIyZDPYLWGbMH4BKrF419o5O5Y6dxRdiyfDB8J3SyQ5VZY+ep3kg1HVfIws8FEcHT33WeVMBJYc+g/gATNtXaHxNmLVfWW5P2v4/vwW6AQT1tW9luIjs9nkJUzq0Z6oyb+94W+5AB1SxYPVBxxQO4n14YLQjsKJNaCVJm1IZdeI6xQ4ufkco4cHUE+60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21)
 by MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 06:43:56 +0000
Received: from SA3PR11MB8021.namprd11.prod.outlook.com
 ([fe80::a8b3:7565:9b2d:6789]) by SA3PR11MB8021.namprd11.prod.outlook.com
 ([fe80::a8b3:7565:9b2d:6789%3]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 06:43:56 +0000
From: Kevin Hao <kexin.hao@windriver.com>
Date: Thu, 16 Apr 2026 14:43:38 +0800
Subject: [PATCH meta-arm] arm/generate_capsule_json_multiple: Fix
 --selected_components default behavior
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-generate_capsule_json_multiple-v1-1-5eb1199535f7@windriver.com>
X-B4-Tracking: v=1; b=H4sIABmF4GkC/yWNWwrCMBQFt1Lut4G2qaG4FZEQ42m9JUlLHiKU7
 t2on8PAzE4JkZHo0uwU8eLEa6jQnRqyTxNmCH5Upr7tVTt0SswIiCZDW7Ol4qCXtAbti8u8OQh
 INdlRmnGQZ6qRLWLi929wJY9shImebn+Tyn2Bzd8+HccHDS0hvowAAAA=
X-Change-ID: 20260416-generate_capsule_json_multiple-e36fc83a8435
To: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Kevin Hao <kexin.hao@windriver.com>
X-Mailer: b4 0.16-dev-7777e
X-ClientProxiedBy: TYCPR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::15) To SA3PR11MB8021.namprd11.prod.outlook.com
 (2603:10b6:806:2fd::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8021:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 6150c1e0-c2db-40e8-1c4d-08de9b83882b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	lPNMc+lBfYIW7w1k3S4IE6HG7VBEu6WRt4taVYL8SdpYd8dEzP8EmpQBq6rKh/8ncc8KiG7uh2tF3azfitr06JPAq10Acg/06VaeZLGXBwBhYGx7IKIlRx3a014h2inSCN7omzX40YruBtRos+xhx3NZSNugoYsnRO4UuEVCNmTXjC8D9+t0KjKxgoHAC6/wYcUm2djeUZaC8aAYHYcR7W6EyHPD6Rbgf4wlwnv7lYcCn9L5CoJfs4LA+Z2cwPstlVDPv/yRRM2cga3opkILI9wlBuVIhJCrn8bSC4vUPc42Xbds0bZ2l/ksI3M7ERmc0uUBkI3oKNPpeg9HvByqZXmeWnCk59/55/KddJaCt9kZKLMmVMAx9ybhaWgrd32P8MbQHlod1iF2YgIjo7C+RVNMSh+ot9G6RE3fT/UAN9obRAu4pAI2tYRt3B7pb+HiVFTBojlLnEOjgqMFtdZuKkEHu9vYjrzT6oPdvEyhk5Ya5+dVH3h84prJ/4IqWoUMmSKu+sShytswOfMmQtHmpXQAImrTnPWREf5P5NYccHvc8GF9qmlYxQqCdqC9hNSneRPGNJ/s/Kjt26AjPVoSP6MP9eFZgyNQBYOOwF2uvqZNhjDKduYusBw7w8Rz43mYSfSNQXys89N1yHesTm71KNYDLWz0E+pw1/ilR7zTb/pniNiorl0Y7cyJ7uPoa0+wWPbrfavWDyQiSSVnVF3yjTEXHuodxbydTgtzPcomfcjH2wCVO6ly0IJU2Rjg5+PezPRzK32WovcMRdJPYT+6NBI2knGRiMzHVWCyHwVY/2M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8021.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTF6TG9uZDNFNGc2MmFNRENOUE4xMDEyT2RtT2xRUFN0M2k0V3FnMDJUWmRN?=
 =?utf-8?B?ZHlTalVTRndIbGNFdHVscU1YVFdVZDNwSmxkSWVhUkpGaklialRqejY4UE5I?=
 =?utf-8?B?WWN3d25hcTNSL21sek5TYjVrZkZEbjR2L2dFR2hJak90c2NLRVNoeE5Hb2xG?=
 =?utf-8?B?M1ZSZHRreGNPaE16U1V4OUdYV216MFJMbW9XTWZlV1hLNi96eTdHR21vc21k?=
 =?utf-8?B?MXljdVB3QTNGSXlOVjczalMzZ0pTb3ZEWEN4TzUvaHFFWWZxT1FJL01qYS9Y?=
 =?utf-8?B?M1VZY3MrWEpqM3NpeTJuYXgrdGtMZGEvR2NIckQzMjJ6Y1lqWWZBcnZIUi9l?=
 =?utf-8?B?M2hRKzk1OE5XYmN3MXRwVXZTQ29uZTQ5SStYOGZ3TkFQRE9UalRBeHUxTmhR?=
 =?utf-8?B?REx1aHpsQVV5YnNENVJRenJmV0M1U3plUnBGVlhGdzlIZitJVFd5Z2pGRHpB?=
 =?utf-8?B?ZGVydysvTjlIZ29HeTR2bWg4NlRsV1RjVE4ramRYeTlZZHJ5MjNQTXlIZHRU?=
 =?utf-8?B?ZEJhTi8vS2NyaVI2UUkyVDN6VWN3dCtSbTNpVFBPZmR2VVhNM1p0dHBjRXBN?=
 =?utf-8?B?VXpia1ZMUGNTZ3lSWXpUdFRaYllpbHZjWnNqeTJ6KzRGQXN5OERMQnZGQ2Vz?=
 =?utf-8?B?OTU0S3A0d2R3OC9wOVJIZnltT3JIaCtrYTFIem5jdDlZSERwT0NBYXVRNm90?=
 =?utf-8?B?cEpvYzJIVVE3cUFFOVg0dEx1TjNmcTJwcCthbXgwYWw5TjZ0cXcrS2xocVVi?=
 =?utf-8?B?R1B3NkFzNU1zY1RjeEhLZ3h5OVBzSGowS2Z1cTFMRyt2a01sc0pVWVo4V3lK?=
 =?utf-8?B?TERMbjlqWHh4TEdKcFVKZFhHam5oS1dUMXR2N2YxMzRGVmJTVzIrUXN0Y2pv?=
 =?utf-8?B?Ris4RGY2Y3lSN0JqYjZHNW1LN1FBUGk2L29UVURKSUNyQUZNbU0xMHpjRG10?=
 =?utf-8?B?TTd5dXkrSDVOb25VcDVRODlUSUFReEF5ZG5JOGxpS0lEdkpJWDZZRTg5TXBh?=
 =?utf-8?B?ZmJtM01yb1ZXSnk0YzlFSDhhZVZoYSsrZnhiZERuMmNjemx2YWhINzlCRlF2?=
 =?utf-8?B?QVQxZmI1R0MrK2ExVE84Qzl6Qi9lWnN2enZYUzA1REsvMHhBWXZvanNCenRo?=
 =?utf-8?B?NjVIYjdzbWhoS1IyMGl6V0Jzb3I2eEsxdUNvcVJuV2M5cmFXUUYzZ1JhQzk0?=
 =?utf-8?B?RmpoaEw0eVc3ZnJXWTBzamFnM3lmQ1VGU2IrdFZJaVFZc05UdmpQZXZIQU9q?=
 =?utf-8?B?cUJINVErNGpZeHVyRnVIZ3hNckE0bjhma2hVQzVDYXpIRW5HeS9Iamk3d21s?=
 =?utf-8?B?NmcrdkNPZ1hWdGdHb3NoOUJlVUhlQlVRTzdCWWF3WERZK0MvS2c2Wkluam9G?=
 =?utf-8?B?QWhSZGVxRHc2ckQ2aUpCUmhUb0tZV0JPWVIvaEx2MThpU2dxbkswQWYyWnFR?=
 =?utf-8?B?NXAzdERpcXE0T0syaC85d2MyeVhEcDZTbE1wRjg5L1EyREJZcldHWklJWVN1?=
 =?utf-8?B?RDArZmRkYVg1djY1WHpqVTN6WHBNM2xzYnBSaGZaUExGdGFESWpETFE4eUZu?=
 =?utf-8?B?UURteExXVTVGMWU4UXl5bUJQZzhiNGFMc3hMVHR0Um82b0Y5NHRxcERRb3E4?=
 =?utf-8?B?Q3AybTBPQ3JFNitlRU91SHh6UVFxcnRrN0IrQUJReHpUbDd6WWtnYUdidmNX?=
 =?utf-8?B?eEpSU21rV1VhM21idHU1cDFHbWo1cjdRWmx3Z3NSeWhOTDhGSm1RSkptbmxC?=
 =?utf-8?B?ZmVFTGFIbHJnMXMvYnVNM1FndTFDOWdRQzhtYmFZVlA1cllyTUkyRlB2KzRJ?=
 =?utf-8?B?bTdEbUFGaFpLUkY4aU5LVjNYazdKSC9PblJwREdwUUFhZmRIZSs2Wmt4VnFV?=
 =?utf-8?B?UVl2Y0Mzd1ErRFE0aGVzdHA4SDIyc0h4VU11dklQaGxrSGhDMFMzU0lGZExX?=
 =?utf-8?B?ZGxIRi9MdVF2MjJwTkxSSmp2ZW9KeGFmQkhUSW9wQ25NQS9IM2xvQUVsZkFT?=
 =?utf-8?B?amVFWXZyMHJTTEZpRkpVaGdPamxaRXlLLzM1YzNwOXRnNHduU0MvSHMrNkJU?=
 =?utf-8?B?WTJhNndrTmpldTFhZEZSeGZmY202c29vUFJrWERFSzdBaUhnQlFzYkQ5WTlD?=
 =?utf-8?B?Nk1YT3JhSXRPT3ZoRHJDK3AzOW1zTWJRaFRBb3V6ZTF2VHliRlFneVJQZmF4?=
 =?utf-8?B?d0Q0WE5IRkx0M0dQY05lWUJqa2JPVVRDOU5GUkZCcm5IbWM3VGpZU2hFUDha?=
 =?utf-8?B?aXI2dS92VlhFaU1Pa2w0VHZ0N1FyMjRvdTVHQXYybmo1bUJ1czhVUFlwR0JX?=
 =?utf-8?B?c2IzcjFreW54MUR1eGY4NkU2eS9mTm5OZ0hTeERTMzF3MGYxRVA1dz09?=
X-Exchange-RoutingPolicyChecked: 
	lhvkAOLN/QEo96E0L8C07vTklp75vshi9kfDP5J6cs57TzQmsR3DxXxNZ9HvTSRhlv4b+flN+1+OvIOJIi6l9C/QAH77aruboDqkjBwvHhk1BUBOsZgSXhJUGbakMzdvkomzQhscJADzPl1NJplz7Qu9WcRthM9tFL7exCcSz1ucovt3RBuWkpegmoEVOThZNBwdJKLsWek3XAc27WPILM+Kpk4d+a+U3zJCE06TI15A3ih9qucf19j7cJtWIcqc5En2ti+KfAKzx+ktkHLxcn4Vro6fJFzDZE8ll7nf0arKZ1MvDI9GF4QERpDGK43bFTRw0gI4Jq8kvQHB1Je6TQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6150c1e0-c2db-40e8-1c4d-08de9b83882b
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8021.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:43:56.2879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nm2Q/iGMzwptpNZ+vYG6L18doCbdBtq8dpU+2g0f1o4eSjYroe4KpgVs/cODHADJ/Uhu7bTB2yhpXpyCWUhtZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
X-Proofpoint-ORIG-GUID: N7OOyOqUBjzMGrWighf7XUyayxAZAcG9
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69e0852f cx=c_pps
 a=Sj0aQRr/q75bZ+qk1Z6sNA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=YQ0Iesv_X_rlMIHxyNoA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: N7OOyOqUBjzMGrWighf7XUyayxAZAcG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA2MCBTYWx0ZWRfX4TP7H+OiMVPh
 qoVnk8ZB1PHPFZDB44l5wrfl5nskEQ0nuO9i5TgCeqDyRE0MCVoawLEpYXJKLfsu06fJscDgmFX
 wGnD4wwpjt8/8heddP0Dy3Zx4fCejxjNaQY6WRpVQfSd9SVC8pjfzZdjkNjuVB7NGabMWTaOf8x
 AU7RnVODo4r27bauFansncN/5OuSBXrWDiQAape44pVVAfwWK9Gm3b5h2X88mDM8lg0R8vxz3gn
 xN/8Epd1MDO82mVAIbPzmUKBCcVAXKUMJXptVtsdDDY0oC9ETnM7FpyJ04PvsJI+ugBASP4E3JM
 CACoKHQ8wn0MyUxT4CFZJ12hneAl3redpjXCmKJ33HglgVEbqrWzJdwBaWkplIKj5lixYE61YK7
 XqXLWc/B9u/QS8Ym/daN0OzvnFXJOS8AWtDVIHA+kXDEmWnTo9wGXQRCWToL1Jcz7daR4rsE65c
 JHJyJ+fak/0BGSHf81Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160060
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Apr 2026 06:44:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7017

When --selected_components is not specified, the script should include
all components as documented in the help text. However, the current
implementation skips all components when the parameter is empty,
resulting in an error.

Fix the filtering logic to only apply when --selected_components is
explicitly provided with values.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta-arm/scripts/generate_capsule_json_multiple.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/scripts/generate_capsule_json_multiple.py b/meta-arm/scripts/generate_capsule_json_multiple.py
index 1342574813c8..55c4b3514cf2 100644
--- a/meta-arm/scripts/generate_capsule_json_multiple.py
+++ b/meta-arm/scripts/generate_capsule_json_multiple.py
@@ -93,7 +93,7 @@ def create_payloads(args: argparse.Namespace) -> List[dict]:
     for i in range(num_payloads):
 
         # If filtering is enabled, skip if not in the allowed components list
-        if  args.components[i] not in args.selected_components:
+        if args.selected_components and args.components[i] not in args.selected_components:
             continue
 
         payload = {

---
base-commit: 01abd473bc1ddbf399fd10f4c45959ad2e214f3d
change-id: 20260416-generate_capsule_json_multiple-e36fc83a8435

Best regards,
--  
Kevin Hao <kexin.hao@windriver.com>


