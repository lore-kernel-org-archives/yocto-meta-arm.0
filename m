Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3D2C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 20:02:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web11.3926.1673380927263257814
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 12:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dbMjb70G;
 spf=pass (domain: arm.com, ip: 40.107.20.54, mailfrom: adam.johnston@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUwGhxGNTUKmGyuCXnGvWz7VdywHHhCzu/hGSMGe26c=;
 b=dbMjb70GUmsHFLhgi+0gyqAq44z1PDdcjDIBn0X8fgizPphd1sKu7OSL9YqjbSQioP9kULw9GAKR4MzrCd9F6lnNvSw8B4x6Dlhi/5v/c5mUE0iA5wziydDa8XAwcGQ73Z0xuaZD91AQEpvY4CPN7eg0kMgoIBa8vqABjVVpJMc=
Received: from DB8PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:a0::32)
 by DB9PR08MB6620.eurprd08.prod.outlook.com (2603:10a6:10:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 20:01:57 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::f5) by DB8PR09CA0019.outlook.office365.com
 (2603:10a6:10:a0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 20:01:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 20:01:56 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Tue, 10 Jan 2023 20:01:56 +0000
X-CR-MTA-TID: 64aa7808
Received: from a03a7694cf6c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 237629C6-9272-4881-8C81-42F3041A94EC.1;
	Tue, 10 Jan 2023 20:01:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a03a7694cf6c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Jan 2023 20:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fF2KMYdMFe7L+1p2N8zV9ofzBznu343LNJaEuJgoccYieY5G5ZUFEOgwdwKoBWjIV9ERKE55BwOj1hyHcX9XKFsrg4FsHuudui8ivxGQBrdAPwCeXNCQpEKuqIEXDQY+9g+/yFmRJvql+KrHZetB2201lAEDkVCt3pECJlP8B9xoba7Yw1VVswT40vkbVE49D8qQVSEfuvLdeQhT0+qbELEUBbt1mFnGxrOUGprx1lDdFcDlVKRIgTCLBz6V13Uf/ShmATjx7yiiN01Clo54uQAaZHYMJKseHWo0axrawF/NtS6s3MKEpk+OHyPMGmk3zo2jLOvnjhp84kvox3eoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUwGhxGNTUKmGyuCXnGvWz7VdywHHhCzu/hGSMGe26c=;
 b=feXNMCLWp+p+EmTiRKxXpv1LSe0/8LsNmzRZ+5L5LHdqJyhfdKI54ucMJQWeQphckRbSXMtAg7Wns7sJ1h2bCEUo6ZuuIsroIbAD4Ga4Uccs9LWyN6RH6iEgVtZnL5cTJP0mgeszqiVbtP1HmO9mIEyHF1JDHwfTgjex6vMC2uf93O0IHp/7/+AcoknGKguxuIEnplhoqg5k/sVnmObWu7ZaLfCPStO3Z+p57LXtPdYGUioDre16DxXh2X2+o/6LmPfCD8pFsH/SVbmi80ku8qA3+ZGoyuBGL+wkOT589A/AB0Ta3dxgunXeHKkKXmNfR4PAsQ9orBCVr99UI2ARkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUwGhxGNTUKmGyuCXnGvWz7VdywHHhCzu/hGSMGe26c=;
 b=dbMjb70GUmsHFLhgi+0gyqAq44z1PDdcjDIBn0X8fgizPphd1sKu7OSL9YqjbSQioP9kULw9GAKR4MzrCd9F6lnNvSw8B4x6Dlhi/5v/c5mUE0iA5wziydDa8XAwcGQ73Z0xuaZD91AQEpvY4CPN7eg0kMgoIBa8vqABjVVpJMc=
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 by DU0PR08MB9581.eurprd08.prod.outlook.com (2603:10a6:10:44b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 20:01:48 +0000
Received: from PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::5964:d2cb:6b49:b6b4]) by PAXPR08MB6432.eurprd08.prod.outlook.com
 ([fe80::5964:d2cb:6b49:b6b4%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 20:01:48 +0000
From: Adam Johnston <Adam.Johnston@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross
 Burton <Ross.Burton@arm.com>
CC: nd <nd@arm.com>
Subject: RE: [meta-arm] [PATCH 1/1] arm/trusted-services: Fix 'no such file'
 when building libts
Thread-Topic: [meta-arm] [PATCH 1/1] arm/trusted-services: Fix 'no such file'
 when building libts
Thread-Index: AQHZEXfFQBw+PY3mQ0yYzbDyxG1icq6YOYzQ
Date: Tue, 10 Jan 2023 20:01:48 +0000
Message-ID: 
 <PAXPR08MB64322EB5071B5CD97A9E9787E9FF9@PAXPR08MB6432.eurprd08.prod.outlook.com>
References: <20221216175508.3149543-1-adam.johnston@arm.com>
 <173157A89401C7C2.16729@lists.yoctoproject.org>
In-Reply-To: <173157A89401C7C2.16729@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 7C56F2413881D94C82DEA8ADD077A819.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PAXPR08MB6432:EE_|DU0PR08MB9581:EE_|DBAEUR03FT015:EE_|DB9PR08MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 03dbbca7-0904-466d-e52a-08daf34586f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oUe8b94tXD5n016filtO6P+Fxrs1Y5X3kq8iEPuft3eKriI8I1UFOm6YV6PRBONoKKel5/PB7RDTpP3Nb1Bb++ho89/oa+xssPOeYH+NVLTYfa4Xqb2vTq7f1p0fj9Wp4mdljzScw6qR68HdA+zdyaAxkH9tuGfesGxk2XXbbqn4DC/ejnDc+409/2JHhJRd9fnQH3B0DpaPdSUR834vXU1nDqS1cwnQGlvSqEloZUK9Xu2thrBsFBWPvcuU5W/MIR++W5+JGKdvZNn5gGIj3+W8xAfFJWbdOUx0drCWwBA3vS26Tj+n1qVIkGVJRcGmTFP79ob0z3cDaAO6Prli4CePozEScUL1Lb3zMIE6okFrpEE+y31xqb4RsJGJTb9PHxh6XuMZjHUN3nOLt1hqZtcbqYdXm4IAYhoSMMfx01qJn4iQrtZ3F3s8gfUNLNF9Hxc6Q8kFINIE1JDcRH/mvTD3+DV6J3WTB2Ziw7yRQwY4U55ju5lW7ACvTGZUnVv8hHodwImSJJCODVkFA8SRS3qRUKs/QeoHgqOD33ObupofyuYrnr3dLyL66d7Op7T/1Wt+QQ2d7PWbgDJtfCemacuyh/9HwOqj6HGfvm7usrvtNc2wtgUDdYNjsJYwa2gn5QbrPZ2lCQvZVJiH//bUV4mrgmaxlDWDp80uZs2SCr51Vsn39xF9sb4I43plJ5mD0JZI3P9X5fZPh3DLI1Ey3Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6432.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199015)(86362001)(6636002)(110136005)(66946007)(8676002)(41300700001)(4326008)(66446008)(66556008)(66476007)(76116006)(38100700002)(33656002)(122000001)(38070700005)(64756008)(71200400001)(186003)(53546011)(7696005)(478600001)(6506007)(26005)(2906002)(5660300002)(52536014)(55016003)(316002)(8936002)(83380400001)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9581
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dacaa7a0-0b14-483c-5f1f-08daf345822c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RFzU/RJ1O3vHhW4NilNj3JziUsxp6plMpxX3/sl795e38+ZNTUg84x3z0bnl+FktxHf0af1+/VQm6VytfjRp14TO0Z0S1rTyTiDOV4d/6GJ0EufOqKObTiWKMsHix3igfi3fnzwcCXQv+H/7Orn7iAe7hUaKKlmQ07ZJJ1sXUPBb+/yEi8wdZW9+t6CuJkLyz1iddahVNKZON7YF/CGabd8S2w4PNhqW8avsq0qXM3p5v94iiHjaYKtMcOxIcziINP2rqigEaluwz/jooqRusbqwYB62uiiw0sIGPaXHPoKrcak+TJfXFCKaRYJH//O5S06J5MW1bBKnwnflYSJ+Y45t27xK2jzR0QLENFu4Lyo1zb7nLijqXc9kCvich/vc0V6U+9a6OdpPMb69RMQRX5uM7EB/ZodQHqz0+ssthVjl5qU3qAz0yerbNMOPo7ttelUHYSLG2aj83fX3wROtudH1sJtFWMWxfidCkyhg9c6dmIPkf5CGQgruxaaSacPYCN6hrEVxGXFDpHNPQWCzWHQia8yB733f84m53YqRD0BZFjpkFQGHlQuAzxYaw5Vjcc3VjjnrvXXqIDLWSFbaH10R+jLJLaX8UM0saLPiFe+hV+14IK2Bw5hzqibUr2kEt5uC+xp727IfzexzlvHl64IwRav/RPZOjcBXQ5fGSAJhHgLpYjKxQMuMj/fZkBbqCldN5tbGz+4ipMFXrbGpGg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(4326008)(52536014)(8676002)(41300700001)(70586007)(70206006)(82310400005)(5660300002)(86362001)(55016003)(53546011)(316002)(82740400003)(40480700001)(6636002)(2906002)(110136005)(81166007)(36860700001)(478600001)(33656002)(356005)(40460700003)(186003)(6506007)(83380400001)(9686003)(7696005)(26005)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 20:01:56.8901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dbbca7-0904-466d-e52a-08daf34586f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6620
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 20:02:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4258

Can we please backport this patch to langdale?

Thanks and Regards

Adam

-----Original Message-----
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> On =
Behalf Of Adam Johnston via lists.yoctoproject.org
Sent: 16 December 2022 17:55
To: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>
Cc: nd <nd@arm.com>; Adam Johnston <Adam.Johnston@arm.com>
Subject: [meta-arm] [PATCH 1/1] arm/trusted-services: Fix 'no such file' wh=
en building libts

From: Adam Johnston <adam.johnston@arm.com>

The libts recipe assumes generated cmake file will be suffixed with '-nocon=
fig'. This is only true when building with the default type i.e. "".

Check which target cmake file has been generated before trying to patch it.=
 This fixes 'no such file' error when building with an explicit type (Debug=
, Release, etc).

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm/recipes-security/trusted-services/libts_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta=
-arm/recipes-security/trusted-services/libts_git.bb
index 598b281b..aafe8516 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -24,11 +24,14 @@ do_install:append () {
     fi
=20
     # Move the dynamic libraries into the standard place.
-    # Update a cmake file to use correct paths.
     install -d ${D}${libdir}
     mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
=20
-    sed -i -e "s#/${TS_ENV}##g" ${D}${TS_INSTALL}/lib/cmake/libts/libtsTar=
gets-noconfig.cmake
+    # Update generated cmake file to use correct paths.
+    target_cmake=3D$(find ${D}${TS_INSTALL}/lib/cmake/libts -type f -iname=
 "libtsTargets-*.cmake")
+    if [ ! -z "$target_cmake" ]; then
+        sed -i -e "s#/${TS_ENV}##g" $target_cmake
+    fi
 }
=20
 inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-md=
ev', '', 'useradd', d)}
--
2.38.1


