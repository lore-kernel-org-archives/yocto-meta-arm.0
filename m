Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web12.8318.1586338590011884644
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 02:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HQBILfL/;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUG8qHjyqVWdAaNA76TfBMXIjFgOIBFgzIJTKpnnWWI=;
 b=HQBILfL/7BUFx/IaqqDAJmh+NeEoLwwNhKQ8PXVVSDy3y9q5WKyazhWk+TLm1R3Noo7kSWOzYta8sY0ZSSMDZ/tzlD1z8cZDxmign07ct9JxI7e6zWYsAM64a4DilZki1YezwFLQ5ACaxVD3pC0g6JZhES6+TaEbrAUld/jThps=
Received: from AM6PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:20b:f0::27)
 by VE1PR08MB5119.eurprd08.prod.outlook.com (2603:10a6:803:114::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Wed, 8 Apr
 2020 09:36:27 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::cc) by AM6PR04CA0050.outlook.office365.com
 (2603:10a6:20b:f0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 09:36:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 8 Apr 2020 09:36:26 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Wed, 08 Apr 2020 09:36:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b715c142be260abf
X-CR-MTA-TID: 64aa7808
Received: from f433eb713ecf.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 85FE9721-E97E-445B-9AE2-1AE7970E02BE.1;
	Wed, 08 Apr 2020 09:36:21 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f433eb713ecf.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Apr 2020 09:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0g72Vbs/9OPlmlTFr1ec5FxmWsa5JG0MJ/RUi5Kdl9okN0cv222au6ZCuXaTl8Ivu4u0FOEmQ/Ab8NVQBPu+GyIttsvpsWydl6xO5SxHkOOoCkVzBLEnGqgd7ugxm5/ZlScpedEjI5gMOU+YqH0Z1T8t/iOfgSBpBGvJrqobbXKTC4lYXG1k/tl4kiS49ThE2poJ4HDCkskO9BzDZiZqW5+ERa+DlWB1ZPILseC7D6wDwE8zQOFIAvno5Fe+XsYxR+nebEe2zt59+FW8U51QL3qbYtzvbF38HAZd/m1UXUAdRl+5dLAi7qDZ6OrTqfCj9Y/PYbOMxOiZV3sIGei/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUG8qHjyqVWdAaNA76TfBMXIjFgOIBFgzIJTKpnnWWI=;
 b=j1gFKxWFiBZym3hlUxMj2bbaVQaMGyas9Qc4peP8SL9r7z3KfR9TmVjU9e74zT2uNKoiyACyHK2nIt1Roo6Rw4X3Q7Rg34LoofhUe6p4aJcBgT5EyXVy27qaekGOc/o+6B0UZ0+rHggmULGOhJ7b26kOO49PIoK0b5ZWrQZqkcgW2wDxuU0FSvIxmE8hcblWOTfky/yTpTryFJTt00ropv53BvLe5QBVXVUsI0STEIAfPa5uHZSL6ePlAbDElWNZT7mFpGuMJQQJu3WmE/opvCdkXkOtmC2qBDLQf61t+84HhC06dEIsC6TVF0Xdytw7s6RhjOiXtt7jUWPh4WZ6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUG8qHjyqVWdAaNA76TfBMXIjFgOIBFgzIJTKpnnWWI=;
 b=HQBILfL/7BUFx/IaqqDAJmh+NeEoLwwNhKQ8PXVVSDy3y9q5WKyazhWk+TLm1R3Noo7kSWOzYta8sY0ZSSMDZ/tzlD1z8cZDxmign07ct9JxI7e6zWYsAM64a4DilZki1YezwFLQ5ACaxVD3pC0g6JZhES6+TaEbrAUld/jThps=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB3103.eurprd08.prod.outlook.com (2603:10a6:803:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Wed, 8 Apr
 2020 09:36:19 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358%7]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 09:36:18 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 0/2] Move Xen specifics from meta-arm-bsp to meta-arm-autonomy
Date: Wed,  8 Apr 2020 10:36:11 +0100
Message-Id: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 09:36:17 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48c0fbb5-10ae-48ef-9c37-08d7dba04f36
X-MS-TrafficTypeDiagnostic: VI1PR08MB3103:|VI1PR08MB3103:|VE1PR08MB5119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB511963501C0DBAFB700F4C5292C00@VE1PR08MB5119.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:473;OLM:473;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(66556008)(66476007)(66946007)(478600001)(186003)(2616005)(6486002)(44832011)(26005)(6666004)(81166007)(4326008)(6916009)(36756003)(956004)(86362001)(2906002)(8676002)(52116002)(81156014)(7696005)(8936002)(16526019)(5660300002)(316002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mMpCk2XdJ1l4eR6EHThvXGKXoplWdUgTAY+CJBJC8ryNTmSx1wLzO6Eic6Qq7of73wpR7sruxE5T4kIcoGcUPE3VQawWu9l3sKC02dG057m+B3f5Q+Gui2WMXOOTdG81v+rzcr9ZduRG8lgjCHVdC88vancFxOjxRj4NX+wnzgyDNMOWiECMpy5WDDA5Kj9OV6nKIL3OKFwyGItw1EdX5wi26VnZIhu8Yp49PUbp2C2oBRJDVpTdkNCzWcjC27OPFPoiX+TzuuYbotxm+simhFeCLzO77ig/fCuD932zkwmMxlm/4OD9emAz79cbtqtXCXRP3PnunUvrsvc/SUa1oo8SRhdA8I3d5UGMqd/CjcxuQLecpTrFDpv6iQK1E2y4lV89V3W784oH4Va5HkyMhoZhcmxo+I2Cc0X3a6+NOYayaifh3f1Ll+cQmvoHujjj
X-MS-Exchange-AntiSpam-MessageData: 
 EnDCP2GAJXsKfPA8+m0+x798DWnUv3A8Ls3NMyfINQgASLAo0/m6NZRdccC8SJLoUrRsXckaiz0rPOnDJOw0g2soa07JgRQ5eocjQff7Gce1KDAwnT790qvcpSgciVfcN3haAEdnIidKx/1kfLeW5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3103
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(36906005)(47076004)(5660300002)(2906002)(4326008)(44832011)(70586007)(70206006)(6916009)(36756003)(81156014)(82740400003)(26826003)(6486002)(8676002)(6666004)(86362001)(478600001)(356004)(8936002)(16526019)(186003)(7696005)(81166007)(316002)(26005)(2616005)(336012)(956004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a9bdeeee-a1e5-4b67-8d6c-08d7dba049fb
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MdIJCee8wo9p63YXGMiwsvaQ5kVEms6KFxI0H7Ya5jfWj+W+0uvRL5olg37lis2zfcxaahq1Kkc28ybHecxeGleK6a35KktY8i1WESULj/hEgr/Nx0i6fLb9qhpUoNUmyS1J+bNFLWmYNieZGZaebLa6p5h0kN5/ga/FRtuv5Zxex9uOmUsCVcfaxSZRjmb3/iliPRlrpQci87yQbgaK/ZE8V+DtxUavToztn1s/z/hJg+Z1Z6rqq8w/SyrcFTE/1ThPdbzF+hHM/7aBnc96tMaZKB3+SvLfzi/ZIDKLLnjaDaaM4MwoZWmiDSQG5hoCqQ+hutSHyx027nnH6c3ztQgwxMX2kVDX0qj6QqGmFfgWcxLhkx6iT20S5mChdhAjw2t+0w2y16D4LlVEMjYiNAYV4UZx1WCu5uknoVqXVl5Y1DjvgaDQa7+1rVB8m1yt7DytUIcc2o0ezGWCW6SlTaCISHIyp7hSUj4r9LayobLBzYF0a7c4ZhgDDIPogv0/VP+ctsUCcYtfO21JzOXoVw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 09:36:26.5803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c0fbb5-10ae-48ef-9c37-08d7dba04f36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5119
Content-Type: text/plain

This patch series is to remove Xen specifics from meta-arm-bsp and add to
meta-arm-autonomy.

Diego Sueiro (2):
  meta-arm-bsp: Remove Xen specifics
  arm-autonomy: Add Xen specifics from meta-arm-bsp

 .../boot-wrapper-aarch64_%.bbappend                | 32 ++++++++++++++++++++++
 .../trusted-firmware-a/files/juno}/images-r0.txt   |  0
 .../trusted-firmware-a/files/juno}/images-r1.txt   |  0
 .../trusted-firmware-a/files/juno}/images-r2.txt   |  0
 .../trusted-firmware-a/files/juno}/uEnv.txt        |  0
 .../trusted-firmware-a_2.%.bbappend                | 13 +++++++++
 .../4.12.0/0001-trace-fix-build-with-gcc9.patch    |  0
 ...ap-the-number-of-interrupt-lines-for-dom0.patch |  0
 .../recipes-extended/xen/files/fvp}/defconfig      |  0
 .../recipes-extended/xen/files/juno}/defconfig     |  0
 .../recipes-extended/xen/xen_4.%.bbappend          |  7 ++++-
 .../recipes-extended/xen/xen_4.12.0.bbappend       |  0
 .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 +++
 .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
 .../recipes-kernel/linux/linux-arm-autonomy.inc    | 14 +++++++++-
 meta-arm-bsp/conf/layer.conf                       |  5 ----
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc       |  3 --
 meta-arm-bsp/conf/machine/gem5-arm64.conf          | 15 ++--------
 meta-arm-bsp/conf/machine/juno.conf                |  3 --
 .../boot-wrapper-aaarch64/boot-wrapper-aarch64.inc | 21 +-------------
 .../trusted-firmware-a/trusted-firmware-a-juno.inc |  9 +-----
 .../bsp/arm-platforms/fvp/fvp-board.cfg            |  5 ----
 .../arm-platforms/gem5-arm64/gem5-arm64-board.cfg  |  5 ----
 23 files changed, 76 insertions(+), 63 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
 rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r0.txt (100%)
 rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r1.txt (100%)
 rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-r2.txt (100%)
 rename {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen => meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/uEnv.txt (100%)
 create mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
 rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/files/4.12.0/0001-trace-fix-build-with-gcc9.patch (100%)
 rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
 rename {meta-arm-bsp/recipes-extended/xen/files/juno => meta-arm-autonomy/recipes-extended/xen/files/fvp}/defconfig (100%)
 rename {meta-arm-bsp/recipes-extended/xen/files/fvp => meta-arm-autonomy/recipes-extended/xen/files/juno}/defconfig (100%)
 rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/xen_4.%.bbappend (75%)
 rename {meta-arm-bsp => meta-arm-autonomy}/recipes-extended/xen/xen_4.12.0.bbappend (100%)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.scc

-- 
2.7.4

