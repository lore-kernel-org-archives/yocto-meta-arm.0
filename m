Return-Path: <mohammedjavitham@ami.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD16DC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:23:16 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.94])
 by mx.groups.io with SMTP id smtpd.web11.4691.1744881790293348654
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 02:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ami.com header.s=selector1 header.b=V1XEFzYM;
 spf=pass (domain: ami.com, ip: 40.107.244.94, mailfrom: mohammedjavitham@ami.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyZ32GPiCHnOaVi0ATNQ1pcXUPKu1lkw+WtY0zOX27Zr7J45Vw4DUHHgk1EBZh9JWG/giapsEMRemkbMalL2I5tyu+QXz15634qK1cxxnMPR1dTae//loeub/DVoMWvdR7eWhWAbSVXUPwoCLiFQ2F420Oyd77xt+YR0sU9LDSIgzhIqSAkVmTrCDRl65hIBup63ksFuDLH4UivfVMbIKjeGgSGam/oswa62xHO2HM1AMGuZaZVKf5wfcyxKx6jdX1Fc/MxewGqQWf+dEeJw6hd3jhjB1g03yVZc2xR8Fb9FhED590Nby7L27yBMoltO8HlrmHLfnYwmmc9d79xYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYuKaxqvt4NAcpYFdx+GUxLGr5t2bA3HYeAuwUqO0Ns=;
 b=ZlMqX32CmPXup2dsuinsBs7QWdnkBrPI+0ev3TtMJ++nfcOSvXh5sVyq25kQHxDPzJ9fIDX9mlJSvHiD5UWqIqlQuPNU+UhrXt20t57BW0d2TKqJ/Fa+jXRER43eQ/qLhwJB78F3cfWoZq25vxnZv7k/zER43k3bsJ/kEP9/VzEKS32iOlwzYmjyn/esfRPVlDtfC5ErKcpVwVmd1nszd1J9AMIaHamhuP0plehxFeEAusUBxyic4oPc8MkbdWBjrQ5DEGBuAhCHEIUf35Si5h461k1AYQmXQCSbJ3jQAn2/+1U9TkXshdAK3k7/7gkzpYu/1PAtIkbF8QojIAbicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYuKaxqvt4NAcpYFdx+GUxLGr5t2bA3HYeAuwUqO0Ns=;
 b=V1XEFzYMv7ZwyBZgZel/MUFF8HkEyAxlvKdMhtrIjVNAGjmKwB+RziI9Pcbj4NeNWtRX8Ptxn7GgTLU+R4eOrzE8jF8tugMBRbEJgCG53wyxKAU0WDWbJ7GfGnoJnhc3MYUIet4aQUcVYY1bhMN5pSJcj3M21dUMGR+iOqvxMGc=
Received: from PH0PR10MB5545.namprd10.prod.outlook.com (2603:10b6:510:4b::16)
 by IA1PR10MB7336.namprd10.prod.outlook.com (2603:10b6:208:3ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 09:23:04 +0000
Received: from PH0PR10MB5545.namprd10.prod.outlook.com
 ([fe80::1779:e8eb:2437:122f]) by PH0PR10MB5545.namprd10.prod.outlook.com
 ([fe80::1779:e8eb:2437:122f%2]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 09:23:03 +0000
From: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
Subject: [PATCH] arm/classes: add support to configure fvp-bindir
Thread-Topic: [PATCH] arm/classes: add support to configure fvp-bindir
Thread-Index: AQHbr3n3KTZZoQHlhU2mth+H/S0qaQ==
Date: Thu, 17 Apr 2025 09:23:03 +0000
Message-ID: 
 <PH0PR10MB554502D8256670F2960C0569DEBC2@PH0PR10MB5545.namprd10.prod.outlook.com>
Accept-Language: en-IN, en-US, en-CA
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5545:EE_|IA1PR10MB7336:EE_
x-ms-office365-filtering-correlation-id: c84ff329-0b39-45bc-58ca-08dd7d917495
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?AbxzmXhciaegtM8IQaoqi+eVOlKPrAc4D0RBV48NycoPkFZYM2+WF0nnBR?=
 =?iso-8859-1?Q?9PHOBJbPj0b3Ydz9YGDRDWV8njkEHI9PTaZMd4LD6Xw4dtPSTZ2BYykxWG?=
 =?iso-8859-1?Q?cNNtR2bUSKd13ZCxL7ULm/MibSJyjcCuLv5Og2L5tMgFsDqLnXk1rCjqgI?=
 =?iso-8859-1?Q?6mg1y6rViexgRhApBmsG8YeBLO4mRbcvpwxb7sw2TM1iYx2OyL4mx2Cdr5?=
 =?iso-8859-1?Q?w5EC0JWzk2YkPO8b/2kyR7xCyNpxIJO/bendCVcItuz6e44F16/zp52arZ?=
 =?iso-8859-1?Q?sDU0pg3r9q4DG+xNRFw5zHENYOxkWz6Vlc/2/9QoTHKUjD/nfIQU7FUT0X?=
 =?iso-8859-1?Q?X0BxCZ4+mGFKZNy4VDGjYOgrC1IYzYwgF3klf+np3/gnhLM5fdEA0289dJ?=
 =?iso-8859-1?Q?0GH25/fUH9GRi7gBieh/Y62arXwgDO6znQcFy1IZklC3oMdwYQoWZMtLcI?=
 =?iso-8859-1?Q?XZLUVz8ysNgZg+PxXIQccvHFNx/GfrcwZWJ5vQLsFb8KIGeSjW+hJFTQSU?=
 =?iso-8859-1?Q?L+m8BAZxDh5PMqOpRpbL12bnfRZMqehWdE+2FbalTorHzBPUId4jQqeqOn?=
 =?iso-8859-1?Q?cVZfX3Tml6Sliq9LZxMhW1D+NnI8HNuMLSrmbleR6mBTdGMvIL1cn7DNKI?=
 =?iso-8859-1?Q?6VZcrtZypwKPKCkMVZ1NhvOGb2Bs6p4g8Y3ELpbdNqQp62fWbYJJaC2dIC?=
 =?iso-8859-1?Q?6iqndMJvh+M4YT0FspZoFQD2fClzLvhhmxnlQxkN21/SItQCDFURAGZ98l?=
 =?iso-8859-1?Q?KWvNevgFt1kqFg39Sv2N8sPopaGSVGhoJC94ik4d2c1YO/ZiJEUC+SEKSp?=
 =?iso-8859-1?Q?R3DHsumM2xSpa8bxeUAZ8y2LhOzLeoitvSt6kLypDVaVndJwrdHNeETE5v?=
 =?iso-8859-1?Q?t/LHPBWI+zK6U+UFY3f3BM+Fu6CpQQVEjhnxEFrqpPpGXy73Du33Mv5rSC?=
 =?iso-8859-1?Q?shMzpbdKJNoIF26wCPu/eZZ9CQV7MMzgX4OrufAbu6oF9//ZkYEoou0bPt?=
 =?iso-8859-1?Q?HwnFOlO3We+KNhdZGUMicp7HCH0aAeGOR+UMGDQ+S1zLPTlzjO2guMZKsq?=
 =?iso-8859-1?Q?ePC9YnS8qnfq25hyaM3AjCzxQPHw0cm6gPT21ugm/arbNO0o6EQEQItZat?=
 =?iso-8859-1?Q?cRhnePmFL6DT7hNsBXP87RWEKKiQeZ0GgkkICOxEZM3Ylp7JNhWaRQubYk?=
 =?iso-8859-1?Q?SKhrSYzxMXXlwlxKYkMECVUSIQwhSQ34MVMmuSreG1oyt3yAITpFBdZArs?=
 =?iso-8859-1?Q?568inZEphnYpF1EJgXZl8bw05N63IXu7DpzpyTmsus/m1EyYHhvtznX6QF?=
 =?iso-8859-1?Q?sBL144hjEYY+jAaOBHJje/8LPSoF5oVGMR+5vktJhJKX1VnDJhTvxmWkz0?=
 =?iso-8859-1?Q?cm+7gibFI9P6WPbBz2MTEO19IW8BYtZHdfDRoRL7xP01qe6uqEtMq7g5ou?=
 =?iso-8859-1?Q?KVhiJhsNLnvdGtN6mTgsYLPHXTqPK3JXKz2UztIfDjZy5PDqzCrw3drzmh?=
 =?iso-8859-1?Q?EUUvqvlWsVCqi3vV/N6NfsnkzvA7F0NHUuy8WcWFQ40A=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5545.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?X/1vETQUM1mPXi1nrx0qKpcFWfa6Wq3PMvOCG/MfOd1d3gj5bEE+uj4Qwi?=
 =?iso-8859-1?Q?tIZ0gRWYhSFTNnXD22fTkSQ2LuzztsVIOvT5AFAXBXXMx85GfO8BX3whsq?=
 =?iso-8859-1?Q?fcA+IXz8CDhSjNa6SoyNA3TDTaUzvLelwkeDp4neXB5lTvDBcEow+aU1Cc?=
 =?iso-8859-1?Q?8uPjMgs8iewyNwbV2SK/uWp9cEdpxJXdOOZWdbuWw550Z0VqbT41/BrRMH?=
 =?iso-8859-1?Q?cKKHPF0gz/wiXUI8CAvK2tB4lf8NV9YtUQ53jzRCt6baUNHCobijhVkK6U?=
 =?iso-8859-1?Q?6x6H9I42aZXBPa8VPm32FWc585pDhtjS0PRPBaHDIVoCn7Bxv4gFH+eWXt?=
 =?iso-8859-1?Q?0hUoeGm4wbA1AMukoPPS55t2uLoIiUr2mKgb+WrxIzOutdCwHgKp+YAYVt?=
 =?iso-8859-1?Q?aF/aDk7FV07Q5zl0XmIQSurT2vSJ6QgTrzmTu6iDBHkrzFBuERiD4kC0FG?=
 =?iso-8859-1?Q?+W7IUB805/GAUQ86MF71r747gef0w4XVRa8HYtrp33G42zQmMxJRiSpXdc?=
 =?iso-8859-1?Q?Li1a1DN5QtjFPEnLgSaXGB2uz8kZ0fE/NNFX9edvHk68nuIiIKEI0nD6Fp?=
 =?iso-8859-1?Q?m1tSxhwKBiddBz/b6WdsLpObDAl2zPvfsSN6iJqEo5xqoaPvKMgmSND/8V?=
 =?iso-8859-1?Q?6SJnZd142AyqnYZkV0cHQr67NOIlIPYVeYobvMCtchwYO4oKKyav5udzVL?=
 =?iso-8859-1?Q?ptr6VyhVkvCHGDw9DZCfUhP38TZ0D7YDrMG2g233sa1oiJ+K3U+zczP4gS?=
 =?iso-8859-1?Q?uu8DKMyT+quAAmsYhctfZ05vCZosTsREKwo01EqCpK6LdnmTR5S02UI1o7?=
 =?iso-8859-1?Q?OpEEGotjipzs64k0hzw3GPAYEA2cTxprHJlIoHQZcfSPp56tuE2fP9X8Kh?=
 =?iso-8859-1?Q?B5hgheoN55hpSFddnUNxDdBlLkxdWFj8EPR9ZM6FC7VHR45d5o44b45HXx?=
 =?iso-8859-1?Q?sedN7c0SQstt1S/PUpq5yIxlZczbfpR1YRArrqSWmnTNzxfVe3uRA6uxXQ?=
 =?iso-8859-1?Q?+TFHG34SaK6rlcLKr98JZhomBOftzq2qRovXrGdwDMqcRndijCcLH0Eaqp?=
 =?iso-8859-1?Q?HDQpc8u/N3j+41YK+vxxO5+l8qjiLJZwLrR2NTlF8OHJzlG/3raMuJuedV?=
 =?iso-8859-1?Q?bMvlMsqPHK3p7zXKnze0IqEgmr3wVlWeyuVkCClNXfo2xlfGS4AUsbpJBa?=
 =?iso-8859-1?Q?n06zVxgNLTdfDACDAv0jrgIGWtu59K4xwlBLBsniDiewLFkL7BsSk43A62?=
 =?iso-8859-1?Q?IGKirInF4d6FsNmPG7hbfOEiXjNnzAyg6btAYom7pPmTDUxX8iboNsPMvb?=
 =?iso-8859-1?Q?GwjjdCTkant0wlXBSeAot4L8Ii51xvfkXONn+COITFYvi1XXkXVEOfkib3?=
 =?iso-8859-1?Q?ODeLtB2AwQlshUDczLp9xbnCtngonDx71JFMTqLZu8pY+6nDiu23Omc7Oh?=
 =?iso-8859-1?Q?yzqhZKBXJTZl272znyzZ+pdJRVXnlYp4cPhdnMUp/1gKMm5wT/usEwOfYx?=
 =?iso-8859-1?Q?YQWN9jZZBTQBTGUKsk7gHW2pfMg74q2MF3CAWY2e1ZWsmfwbafzMY5xi8T?=
 =?iso-8859-1?Q?rvUKhIcoltTnlaLhE9x4Kvm1Ph3AtcuER+NyloA06C5RQ2WKYNekhx6fou?=
 =?iso-8859-1?Q?N8KhW2KdES3jp9LW1c1KO/c2qefwg7aeKo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5545.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84ff329-0b39-45bc-58ca-08dd7d917495
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 09:23:03.6119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlI5uY9XDa7a0jCvv9lLOsKpIM3G4T/jAvPMa5c6VOibQtIuNkHnz8mixMh/AABLdJGCifQwBSb9sgmOkHfX4bwB8d2YnchsMEEOW7Ji7/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7336
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Apr 2025 09:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6466

Currently, fvp-bindir is configured to use the build path. This commit
allows customization of this path by defining a new variable FVP_BINDIR
in fvpconf. This change enables the runfvp script to execute without
BitBake initialization.

Testing:
- Tested using OpenBMC FVP build.
- Defined FVP_BINDIR variable with a custom path in fvp-config.inc and
observed the changes after the build.

Before changes:
$ jq . ~/openbmc/build/fvp/tmp/deploy/images/fvp/obmc-phosphor-image-fvp.fv=
pconf | grep
fvp-bindir
  "fvp-bindir": "/home/javith/build/openbmc/build/fvp/tmp/sysroots
-components/x86_64/fvp-base-a-aem-native/usr/bin",

After changes:
$ jq . ~/openbmc/build/fvp/tmp/deploy/images/fvp/obmc-phosphor-image-fvp.fv=
pconf | grep
fvp-bindir
  "fvp-bindir": "utilities/fvp/usr/bin",

Signed-off-by: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
---
 meta-arm/classes/fvpboot.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.bb=
class
index 3d8536fc..e5ffbac6 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -48,7 +48,11 @@ python do_write_fvpboot_conf() {
     provider =3D d.getVar("FVP_PROVIDER")
     if provider:
         data["provider"] =3D provider
-        data["fvp-bindir"] =3D os.path.join(d.getVar("COMPONENTS_DIR"),
+        bindir =3D d.getVar("FVP_BINDIR")
+        if bindir:
+            data["fvp-bindir"] =3D bindir
+        else:
+            data["fvp-bindir"] =3D os.path.join(d.getVar("COMPONENTS_DIR")=
,
                                             d.getVar("BUILD_ARCH"),
                                             provider,
                                             "usr", "bin")
-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message is not the intended recipient, you are o=
n notice that any distribution of this message, in any form, is strictly pr=
ohibited. Please promptly notify the sender by reply e-mail or by telephone=
 at 770-246-8600, and then delete or destroy all copies of the transmission=
.

