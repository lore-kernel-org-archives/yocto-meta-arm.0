Return-Path: <mohammedjavitham@ami.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14408D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:46:21 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.122])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4797.1765187171882667962
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Dec 2025 01:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ami.com header.s=selector1 header.b=EQ0eDCb/;
 spf=pass (domain: ami.com, ip: 40.107.200.122, mailfrom: mohammedjavitham@ami.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+5icNi5ljxAfPmWp+fHTv8oEGmyhB4NZmkh6UcRXmY9xgKaDwp0p/ErvuVONmDfluTIGRg2tQzaUJcQa7fneQ0/TzpXq159yA62J2qgDdrX7uaN+AMb/Hkc91Hgv3EO4xOjJtCjvrJePjJdi7qaMxRZtoiamJBu8aqfN64YOeqy216Z3680MNGLMAWH1JWozQtwaZL7IxPIdA12MdKeEGKdKFMZxjNKUOnh2CRO1CL/OWBi7dFCPDZAss5QT77RMisZrPcU99P4iFyD95fRPbM5o2PmPSAHBh78XHHrYLQBElHsATaQCxAneLB1GXGTtNadckauuvi8VkFDTaAHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhiXq42rcDo6VCc7b+G6EyRlZyk9uEE23JqsPuX4QaY=;
 b=v4FU1jAKKdCustw27bM8pWBQKvUVnqquEnu2a7m4/2sQYh0qp2xfIZfTHL8MaOmKmrxp0q0DPkXpeMm1+0/LFmZBfOS9L9QGRVj7ZAEcZPgaaXFC2XqBSiXsHSmmNhDMOOR01ozrsEj5kxXao2yeEPsqaz6d3n1HoVCXLBFN+z1EcBNT4aSHrofJCz+UBG6dfHSATcA/V4Ih0fWC6ntGfQZjbhBBoUv3kxL9xlF2yXUi/Co8fw4z9Mf8K4UDeJpfOFScQWAgRDLEGc1m0o1gWLfFuav1pVQsfG65XxOJ6CO3T9VClNyw/ircbkMnh+f10vu8y7IL1LFL0OuIOBqzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhiXq42rcDo6VCc7b+G6EyRlZyk9uEE23JqsPuX4QaY=;
 b=EQ0eDCb/aNZLfR+GpEuJ2QCYYtFqREMEOTFr923aSd7xxUpXX7WPO8LNjODSfO+Zi9ooFy44z79Y7e7jDuFpwdJKmereL/mShiAxFJVSXEIQoC6hLQYPZa62gC5/7+u1g40ujYF9dceNU/3x7icaU/SRX5oCn8V0bppxpSjuVTY=
Received: from SA1PR10MB5885.namprd10.prod.outlook.com (2603:10b6:806:234::22)
 by CYYPR10MB7568.namprd10.prod.outlook.com (2603:10b6:930:cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 09:46:08 +0000
Received: from SA1PR10MB5885.namprd10.prod.outlook.com
 ([fe80::aeab:6720:fb89:73b2]) by SA1PR10MB5885.namprd10.prod.outlook.com
 ([fe80::aeab:6720:fb89:73b2%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 09:46:08 +0000
From: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Gayatri L <gayathril@ami.com>, Hariharan R <hariharanr@ami.com>
Subject: [PATCH] arm/fvp-base-a-aem: update to 11.30.27
Thread-Topic: [PATCH] arm/fvp-base-a-aem: update to 11.30.27
Thread-Index: AQHcaCcB90ZwkK/HuEiJwKrj9rNnLA==
Date: Mon, 8 Dec 2025 09:46:08 +0000
Message-ID: 
 <SA1PR10MB5885A090DB0B9F373F6A84F6DEA2A@SA1PR10MB5885.namprd10.prod.outlook.com>
Accept-Language: en-IN, en-US, en-CA
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR10MB5885:EE_|CYYPR10MB7568:EE_
x-ms-office365-filtering-correlation-id: b647ea3b-fd47-4c9a-9acc-08de363e9d04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?oEF4D7QyWIleVCLZ2yHlQvKWcO+eK7a1LP5cbflW13FmsPrQaTkdjG1uZb?=
 =?iso-8859-1?Q?QVqh0oZhZ0d8i+Gb+EdcDG6WWWcssSdYzRKa5ONJflQdfylSGpIi7yJaiI?=
 =?iso-8859-1?Q?5SxNBaVORbwDVInJuC6jwZ0ebghEHrzNugPdre7l9j23G/1QnKecL4uZPH?=
 =?iso-8859-1?Q?Lh4y1OLpkzzP2pA8u7BlO0zuT3JlR7X3cgFLrZzYO9FHk7HH66b046ea8O?=
 =?iso-8859-1?Q?kR6w6qQ6RySpAlimmMBjhOjthwV1XhXN/NIutF5VtKHgThbAMo89xbhUHB?=
 =?iso-8859-1?Q?lb1/SXM3lMlZcclUnQFJZ6tkv6J4SBs9Xs0+MxPxG5gni/IBrLUMp/ic5Y?=
 =?iso-8859-1?Q?eylU76FJLKdF3REAUF319Ft+UC5Axct8ybTBgDs/2d7fVaLYB2QbUwLxpi?=
 =?iso-8859-1?Q?tRZ5Bj0mmy2ZN70vakQKPLMLd/i/IGHyK//jMygsShFGJww7BMpM5HVp7b?=
 =?iso-8859-1?Q?AsEWvzf37tuikfu+DX49H4fDl34+h+jaOYMesTwrZToFMLFQeuNT+8juVB?=
 =?iso-8859-1?Q?t/dLpqQGySRz+PYA3NdKDsnTKxojqIxw65h8TQYV5MhzJkcAm9QzOJfQzw?=
 =?iso-8859-1?Q?r+4GsqvyWhJf6qwNY8BXnRofZJF4L8exRKWb2aFTNUK5Ib3UmlCGKY8tj2?=
 =?iso-8859-1?Q?V6WFX/iUQYGfymmExS/huzVQ9NHcg9f1GczggYafII8udFZNLbs+FHPGaK?=
 =?iso-8859-1?Q?2zT3p5AyoSGpyUDISC5PKNrjU02L+dMwZzqeaHmCYdgSIP0h6ib5oENHa0?=
 =?iso-8859-1?Q?9eiaKve/53M1I6jBbSfjTx5kkgNFEraBoqP/7QMO92FIUQ2/VTwLEyJzdW?=
 =?iso-8859-1?Q?ylx60gWAtEF5DQZogo9XStYBrNdFRaqNVf90OUr6EWPFYPRnksRE+LwodB?=
 =?iso-8859-1?Q?RwRiA5JVmfv5Qhm5kA/v9xzKnmdHNahs7DSSL4R0Yn18ZSQYtz5jMdRdSR?=
 =?iso-8859-1?Q?J0C2c6IGwXeKQIvNRVEtmew2VMHIpt4X/xHbMP/KpUgdF0t9TntpEw2Z8C?=
 =?iso-8859-1?Q?xJx2d7SnPmp8ZpbYIU2okpKA7tPmP3sz0AfV0Uto8PAHt1d/hT0tIiRdpZ?=
 =?iso-8859-1?Q?Fge1GooBibsmnGxh+0tte431hucx9oM0cqij6slsgN30QX1dYiNjz9VyFw?=
 =?iso-8859-1?Q?r8EVrTHikYshyajx6K/DP4HPm6OQY+G9Uov1NhKeMHW06XYic943qyJWNU?=
 =?iso-8859-1?Q?lS5iF7A8fe/B6xQOjHkAIMe8t+jcMCIML6BmY5ESHEmAMM1WA/mjNUnPni?=
 =?iso-8859-1?Q?EY6PrCz5siROqC/YnGU1/PuCmJE+xxn1CZf37dhp8+DKUVK12u240XbKw+?=
 =?iso-8859-1?Q?DnTrw5baYQUOxEBXLfmtLw77KrWl348qNB9MeoYBnZ3hZ8ZZLda92MZMHL?=
 =?iso-8859-1?Q?LBGxy0WIGHjJ8hOrq+QrcVjZHiW475U66pxEruj1uy6wn9VoRupgDR98ra?=
 =?iso-8859-1?Q?nqnfEraxJQEcMNgLaAjAuK4FWxqPtINkGbF6hXdIuJ4M+XCbUmVAc0y9wz?=
 =?iso-8859-1?Q?rZnWeVUNOdmrp2lgZnwbr/ymkrc6nfD0B2MCdk1NlA7SaFq3neHeLILkc/?=
 =?iso-8859-1?Q?Nv3N0BD689KesYg7J7xxvAWC7tay?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB5885.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?WJf+cjk2YgaK6EhruymA1X+xQpIVHKepM5il/l8DHp1S9e5pL4FMONBKFO?=
 =?iso-8859-1?Q?in5PYjACvB7Kcb68UplT/FDZJ9fytq+rkJRiZCi3NmUTybtS2feax8o5TX?=
 =?iso-8859-1?Q?6b3YN0ogiH49NFEwmGsaBXU7uNuCtAuocSMfJFlI1lmP16nIDmRNIPnLkW?=
 =?iso-8859-1?Q?Ui2wDafOYs/sIZlZkCp954RB9sCeC12CB1wv+AlSm6fDlScfwcFf/Tu3MT?=
 =?iso-8859-1?Q?RsRhyKTOUyY9cflPLD5iwaQb5iEQU8jXxQzh4hUmEdSqe+SGvswRmE7HF9?=
 =?iso-8859-1?Q?BQBm6dntHUZxlscBrUF8j4eGmwBRJSB1Nz+2h6oHAAJ63ScgD8L6ovbakP?=
 =?iso-8859-1?Q?RtD4ktntQ3HKUmHL6GHIK85l1PSe2hDwJkZY+MTHpEwM3Q3C38IztQCNDT?=
 =?iso-8859-1?Q?tBhFG/O3AHisy3rEu410b1hW/UpM7LOeHVKvRdOyxOVK9SVbHKXSiLGpqo?=
 =?iso-8859-1?Q?m5RzIHhsK7RrSkkvnkcbW+SWtHT4z31uGEhdevSZGnd7caqJit8+NQBM/B?=
 =?iso-8859-1?Q?WZeUWQcAi3jSHFuPv3XZrqhqqQQmhu6LGQTKtrV91DUegMV+dsGsD7q6JR?=
 =?iso-8859-1?Q?S1LM9A9txC+uKbWdZrI1SDRFVK09tC8l3ftZU7Dl/n/xToYHd7R3y7cg4e?=
 =?iso-8859-1?Q?Pc4pFfUF0IyYTHfQ+sHqMkQJ3jFc43DSJ7XbDBGHm0HYn3Ma6AywRNrsA3?=
 =?iso-8859-1?Q?Fht6OjhtPLUsFw3rYYyMHIwDMO+UQ+7WgtdZg00KgHtGYYlBF+aSxIbXWp?=
 =?iso-8859-1?Q?zb5/WVzvoPQ/wwFSCNN8sNZ3EgB3Dej4aUE+wlvRvp4xF19p/0n2tDlw60?=
 =?iso-8859-1?Q?1Z5Yo95DXO1UuFf0cYwD2IU98oZ3UuEbamAt6EzRxDNjET8kBsSm14FTWR?=
 =?iso-8859-1?Q?vU2kmnqw6AGNgLJ5KhU7uykJPiXC8xL29XmF1pkMAQpAUVe6+CD18itzIR?=
 =?iso-8859-1?Q?y1pQpxiPop4ooZeIr+TyayeKIEvD5+8d/MmzpJkFhb3STpvZxLvmj71uGp?=
 =?iso-8859-1?Q?zYM+DdhnBpxBBidv3MtklN8pvTfQpsuqrSgflSSEpu4ersXdCLqmj1qjvm?=
 =?iso-8859-1?Q?9ldw9qc7VoLUSvg7LENaVBFofDOifvF2wdeSZ7DsIDV2Q3CsbmLR8svjKt?=
 =?iso-8859-1?Q?LRdMLy8TIMUhnuo6CZU1ovdzEhIiNwxOmScEmrZD2LjTtsBSWhWuIIB2Jv?=
 =?iso-8859-1?Q?j3k+/iNXrIyH5q38BNwd8k5Hk15gmNg65PUSd4DpL3n2n4IO4efxPnN5ra?=
 =?iso-8859-1?Q?OYPKKZuEUXUxXFba2lxchdiJnQkt6OrhE8XASyl1FXHLU3U1blpdHMuNJ1?=
 =?iso-8859-1?Q?igXQyQpzE/N5KaQ2zcOl4q7RHk0bGBVpoPneQwun8dFhZKrEqvWzhKxyf3?=
 =?iso-8859-1?Q?HysqO0x8UMmw6Vs0E6dGILxW4zVcgo41NmG99RgVGkzrecPYKh8hbUhUMY?=
 =?iso-8859-1?Q?tHNbrzLQE47kg+ztR45QuJi4Uk09wGSyevDVKYCKc++bJPEwtep+rvVeOF?=
 =?iso-8859-1?Q?vQmiiwqr9qdZITYdpagaCId6gszBi8fuFYw21IebUD/pkuLLMF2BcEk+hE?=
 =?iso-8859-1?Q?mhe0kPpBeS2Yn1Er/xJ6WbzotawGMSWIAQ1nsmN+ngJHlsLpvb92tVs10x?=
 =?iso-8859-1?Q?5PyUNXGsr8Fro9kA8PKHQbBItJaL7veiTp?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5885.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b647ea3b-fd47-4c9a-9acc-08de363e9d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 09:46:08.3118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNag+IHjZG/K6DpQX3KKxHQQ03fLBPRwDzzs3XdqgMF0vKfyaJWJdHTy3UvHdxAPsQyv7Q0WhCaGQa/bFGttLIl55WjCiwI1bSpld/n7U0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7568
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Dec 2025 09:46:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6786

Update Armv-A Base RevC AEM FVP to latest version

Testing:

Able to boot openbmc firmware in updated fvp
./meta-arm/scripts/runfvp --console build/fvp/tmp/deploy/images/fvp/obmc-ph=
osphor-image-fvp.fvpconf

Signed-off-by: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
---
 ...-base-a-aem_11.29.27.bb =3D> fvp-base-a-aem_11.30.27.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.29.27.bb =3D> fvp-=
base-a-aem_11.30.27.bb} (64%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb b/met=
a-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
similarity index 64%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
index a45fa153..23bf7a16 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.30.27.bb
@@ -4,11 +4,11 @@ LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-Cla=
use & Unlicense"

 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture En=
velope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1a3=
3828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_party_=
licenses.txt;md5=3D92ea58bb219213dfdc48111b693019b6 \
-                    file://license_terms/third_party_licenses/arm_license_=
management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf6664c5=
1f9075c5b"
+                    file://license_terms/third_party_licenses/third_party_=
licenses.txt;md5=3Da5ce56e117d0ab63791fbb7c35ec2211 \
+                    file://license_terms/third_party_licenses/arm_license_=
management_utilities/third_party_licenses.txt;md5=3D25c38921c5071644ed08828=
8e5bd9b8e"

-SRC_URI[fvp-aarch64.sha256sum] =3D "8fce0dc6346c37b0df4809d08b599463c880b6=
375f9b58d89a73fa6f9ab2e129"
-SRC_URI[fvp-x86_64.sha256sum] =3D "8a8c4a609c32890ce96799aa7319fff3ecf752c=
7a9dab52b2e968cb80cc1836f"
+SRC_URI[fvp-aarch64.md5sum] =3D "0905dcb10065ba6f82a757cdaa961079"
+SRC_URI[fvp-x86_64.md5sum] =3D "8f81bd127bc5bbf9f48eb5dd395a9c40"

 # The CSS used in the FVP homepage make it too difficult to query with the=
 tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message is not the intended recipient, you are o=
n notice that any distribution of this message, in any form, is strictly pr=
ohibited. Please promptly notify the sender by reply e-mail or by telephone=
 at 770-246-8600, and then delete or destroy all copies of the transmission=
.

