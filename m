Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.70])
 by mx.groups.io with SMTP id smtpd.web12.7593.1589180335598469663
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 10 May 2020 23:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=R+vdeT9h;
 spf=pass (domain: arm.com, ip: 40.107.22.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMWQf9KzlTK/1FnPHCiJlFVxWAqY5rjxz2D5e29kwns=;
 b=R+vdeT9hrdWQPsJj4UhcNbRitzLmZgFh5cB1Sgh4bNGgFiai5Isl2Q6CyXcgrclUppW5Zsu5wnbUoVfOfR7lrpaTj4S43C7cw+j/erOwwg0trExDQ3jxyUq45oe48eQfyk/9lf8++z8YtuEe9bMjjtgyNs/KSKFdAS1dVxXhupM=
Received: from AM5PR0701CA0020.eurprd07.prod.outlook.com
 (2603:10a6:203:51::30) by DB6PR0801MB1734.eurprd08.prod.outlook.com
 (2603:10a6:4:31::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 06:58:52 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::3) by AM5PR0701CA0020.outlook.office365.com
 (2603:10a6:203:51::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Mon, 11 May 2020 06:58:51 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 06:58:51 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Mon, 11 May 2020 06:58:51 +0000
X-CR-MTA-TID: 64aa7808
Received: from a067f1f87421.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 325A99D6-90EA-4F46-AFB6-9F685833C909.1;
	Mon, 11 May 2020 06:58:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a067f1f87421.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 May 2020 06:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JniZ1zXnaxoFYZivN7eG7xAvHRfgUlNY5NoL6Kdo7hbuyWLrf/eoD/Kwrh1BiwHsqD21vNo+2752i8aHGS6xrQ07W2iZ3BFR5G5rckxAOkB68rFJzk/jrtMO3jlnN2WIgxNQWSrL6zYq7zMZmg3WuPvnVrgKQaM0da6CFjYUA+/CXsOSTnRs7OCJMYfvoiH86ChBKpfpHJ2Cgby03dxkT7XbPT1Bc6aLN+BZ4uBuOVoiMG0wIC27TIKGEdR8nz/JhBM2sbib2jK78VzEXGpU/mzgfVdszoAMyZ+hXBnkMvi2EDb/NN/Bj17bsE1PlGTpZDSs3F679TV9JZtgCyUm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMWQf9KzlTK/1FnPHCiJlFVxWAqY5rjxz2D5e29kwns=;
 b=b12jQzn8cqqF63taaBcDSshiEL7auaLgD3VwogKPHCyqxZ7Ny5tT5BIRFjFr/cFhtT4fM8R7M3kktNAD8RnhehYihlgQKCGUUeus88xVYcgU68WTQAtRitG6eyroByJrcutnv0/YLUd7kQh5SA7NbS2ljJ/nx3WbP2XNm0lwLzDtWzpFLJpp/jrm/TVPMy94EDG5E7jDV8/NmhIqAlc+F4TSW8dXMfV1FNj5dWnnTjd328fxXYBJHTOvdguWK/1vE74WRdl6ZJXAZmXU7XqRbedg0d9XMvcpudUhcBLv6Xd+x2/sG7uquSs1EwVpc69J0eBq7s32OohnRuU19GmgZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMWQf9KzlTK/1FnPHCiJlFVxWAqY5rjxz2D5e29kwns=;
 b=R+vdeT9hrdWQPsJj4UhcNbRitzLmZgFh5cB1Sgh4bNGgFiai5Isl2Q6CyXcgrclUppW5Zsu5wnbUoVfOfR7lrpaTj4S43C7cw+j/erOwwg0trExDQ3jxyUq45oe48eQfyk/9lf8++z8YtuEe9bMjjtgyNs/KSKFdAS1dVxXhupM=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3537.eurprd08.prod.outlook.com (2603:10a6:208:da::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Mon, 11 May
 2020 06:58:43 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 06:58:43 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>, Khasim Mohammed <Khasim.Mohammed@arm.com>
Subject: Re: [meta-arm] [PATCH 1/4] arm-bsp: Add linaro-arm-linux 5.4 kernel support
Thread-Topic: [meta-arm] [PATCH 1/4] arm-bsp: Add linaro-arm-linux 5.4 kernel
 support
Thread-Index: AQHWJVavNgEcdNkznk2a1lrwTO0j3qiid0UQ
Date: Mon, 11 May 2020 06:58:43 +0000
Message-ID: 
 <AM0PR08MB3987882A5D8D769CD7F98FFB92A10@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
 <20200508163403.5987-2-bertrand.marquis@arm.com>
In-Reply-To: <20200508163403.5987-2-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: ab73e74b-3595-4857-a799-5914dd8066ab.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3073efd8-bc71-4ac1-97c7-08d7f578c30e
x-ms-traffictypediagnostic: AM0PR08MB3537:|AM0PR08MB3537:|DB6PR0801MB1734:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB17344677B8EAD1A0D88D5DCA92A10@DB6PR0801MB1734.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
x-forefront-prvs: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GJ7/2+5jZyY3RK+qhkXzlLDqlXNpcB9FvohI9HE+qbbbYzpkKvL8Myqr6yA4K0NNwYIh0xfIrBkpCo30ezKiB77iMhFUAHzOqytVBhUez4tSXJWr7oeSj7M+tmbaYOAfJEvLp+SYCUGcwwONGc6msWWWNROu7tBNIid9TMID9S05hv2F8hhraJCqcgtyWGlOpwqlmWGUKegmr9W+e0xVyABCTPEWQbRutia7Fw26UKK2Y+NYFRHeRxCz+aN2ZKN8lm/O7zB4791do+b/kuN0D7yrzz5ydrS4EcDCDf+SvOKjCkAH9d5FQDYxVkiI9eCaMqYQq6aJXrH+JCDV8hmh7Z5P2XUL//klRU6sdfX50tT/YrZc6OHyy7cr5F3DHTS3giq0huRdu03IGZAgvUWkUVEj2IKVFxgdJF5pvzta1AHxk2W37lY7JcTBPpDr0Bl5OroTIRdqBDPjhy313HdeQJP/8aQ3WMiYwgBwPkvSdCpZA0szNYY73GM8WRgn+hnhzR9Mhzf6tgHyhH+p1imqBHW+e6NRH39QfqHVMmTTjYjWNqNyF/ZtRzHgvPCYkRrAD6AbfiJiaifxeKfI61A09els9msIzyzYBxdrkMqUXrebFEl9kWJbwyLf3mxGwh3e901Zc/CKdOz8OCqmZo9ffwg+burMp7vy0/4z5Ni5NFI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(33430700001)(5660300002)(53546011)(6506007)(76116006)(33440700001)(66446008)(52536014)(33656002)(66946007)(66556008)(66476007)(64756008)(26005)(478600001)(4326008)(7696005)(8936002)(9686003)(30864003)(186003)(55016002)(110136005)(54906003)(2906002)(71200400001)(316002)(19627235002)(86362001)(8676002)(579004)(559001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 l8qxE3DQKul6coSSmNCFAMfwkPsuJvmNtdKz8EkYBVFiTgWGS9XHtwlSEZjE5i0DhuagAzXtTMuAF9TsFkDLCpwlxyiBM3Je+LBBepZl3bFUnywQMNitAiI545lQHY0RbEi5HnCA48ciiIGGwyEARa1Tt4EcaYIWMQPASzGURG6bFHdnRHA6m6yZ2ukYfgjzgauCHAQGIRf9pbN5jRXQr/QgLqHnUDb+NmmZjGDA1VH/JQjzkcqfgC4k3gTnhLOxqe76dXdHsKQpCMJu4MmQlgGSjbrPNK0CaATWW8cFe/R7ikm4avLO6SOqjAbbJzwQglkzZ3fVTXUhIrwwKG7UKDROqjBgB6uQJEYpmHxSe8tCpwMtzH1M44FYO9WAgqMe7RePyN6JDSSBaT6OKm9H9U7rTF4Rx7faXrzPA8c6lN4fKx72HpkRjtiJ3p7cYbdNdTwjulTg2s1GYhvtJUaV3B4iB/s1aYnEmtnnK5jlhRs=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3537
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(33430700001)(8936002)(4326008)(55016002)(9686003)(336012)(52536014)(2906002)(86362001)(19627235002)(70206006)(70586007)(33656002)(7696005)(6506007)(8676002)(82310400002)(26005)(30864003)(47076004)(5660300002)(478600001)(53546011)(81166007)(82740400003)(110136005)(356005)(54906003)(36906005)(33440700001)(186003)(316002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	440ebd94-d43c-4b23-e1df-08d7f578be6d
X-Forefront-PRVS: 04004D94E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T8uoIogIg+tOz0LliQMMQV3zPOZFrPuKvBg31WA3PNxPzn7RXnAd9xqZWGM47AuwrFlEZF4LcFMS4xHLp6vqm06M9n8qhcmzE5AGJwbh63J6wKRPcrSuvv6w7vrXl5nVLB6mjxuiHeB8dGT5YMYR/GycoQXIUlodkvBg5lxViH9T3xfP7TIwVMusEMPn7cBGWI1witqZzmwuVh4flMrJQ47lTLRU+v1wnIoIvuo5iuh3ShOC/RMJ6kXoo2K4c/1IPe+I9/6gKhTeDbKzTbqK0KJDDPofy3A+DcUz49eXrwriRH7DU8ru9hkJcsqmpHShySPCjS1aR6fBmpsJgePl0y2NCIOS1I9INqbGghshuUMHxWJHSoUzJOrtLzaBNNEr0+u9vhH51TuLoFjimAV4848fSxGjNkBwZg1PfC1OSmQSrgUqBtdTx94hphCX/tgjwXRYpQMj2V/JT/4MLNvFMPl4N9SGtxKyT3/KdUdPEIkv1JaBf7XLmuRkUOs/cm7YdjfcOi6IkfY5uqB0h5PD8pImwZ5ubkCybIxdiBI68EWqiTCwOYIEf4wfIbeA7fRAZIZi60j4Lb9dribzzS5mx/JuIhMlrqof+lnlHPwSq9KdRcM7gtKfJBbqe1IleqLxxz8GgHZ0ISltSqEIuQR3H7ngTyIX7HbOgAPtDCbEVHJLHE0dcXtpk0iDhK2+zaENDxblfSUaKaKx0ch0KEaD8Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 06:58:51.2169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3073efd8-bc71-4ac1-97c7-08d7f578c30e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1734
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

An observation for COMPATIBLE_MACHINE setting in meta-arm-bsp/recipes-kerne=
l/linux/linux-linaro-arm_5.4.bb
recipe.

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via lists.yoctoproject.org
> Sent: 08 May 2020 17:34
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 1/4] arm-bsp: Add linaro-arm-linux 5.4 kernel
> support
>=20
> From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
>=20
> - Add support to fetch and build linaro-arm linux version 5.4 for N1SDP
> platform
> - Add addtional N1SDP specific changes as patches
> - Include intree default config
>=20
> Issue-Id: PLATFORMS-3134
>=20
> Change-Id: I3b4cf4b1de509beaa3862e1cad37ec2d88b7054d
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  ...arm-smmu-v3-Ignore-IOPF-capabilities.patch |  46 +++  ...irk-add-acs-
> override-for-PCI-devices.patch | 156 +++++++++  ...-for-the-Arm-Neoverse-
> N1SDP-platform.patch | 318 ++++++++++++++++++  ...e-n1sdp-pci-quirk-for-
> SR-IOV-support.patch |  51 +++
>  .../linux/linux-linaro-arm_5.4.bb             |  18 +
>  .../linux/linux-linaro-arm_5.4.bbappend       |  25 ++
>  6 files changed, 614 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-
> platform.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-
> arm_5.4.bb
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-
> arm_5.4.bbappend
>=20
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
> b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-
> TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
> new file mode 100644
> index 0000000..e1ff4a5
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-
> +++ TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
> @@ -0,0 +1,46 @@
> +From 4ebcbe09471d6b6b18fce42993489bed3801f10c Mon Sep 17 00:00:00
> 2001
> +From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> +Date: Fri, 24 Jan 2020 10:17:14 +0100
> +Subject: [PATCH 1/4] TMP: iommu/arm-smmu-v3: Ignore IOPF capabilities
> +
> +Don't mandate PRI or stall to enable SVA. Some devices have their own
> +method for managing I/O page faults when they notice a translation
> +request that fails.
> +
> +Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> +---
> + drivers/iommu/arm-smmu-v3.c | 18 +++++++++++++++++-
> + 1 file changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-
> v3.c
> +index fed6a9d5867e..a8d7d6ccbb21 100644
> +--- a/drivers/iommu/arm-smmu-v3.c
> ++++ b/drivers/iommu/arm-smmu-v3.c
> +@@ -3276,7 +3276,23 @@ static bool arm_smmu_ats_supported(struct
> +arm_smmu_master *master)
> +
> + static bool arm_smmu_iopf_supported(struct arm_smmu_master *master)
> {
> +-	return master->stall_enabled || master->pri_supported;
> ++	/* return master->stall_enabled || master->pri_supported; */
> ++
> ++	/*
> ++	 * FIXME: this temporary hack allows enabling SVA for any endpoint
> even
> ++	 * when they don't have PRI/stall.
> ++	 *
> ++	 * To implement this more cleanly, we need a third method,
> complementing
> ++	 * stall_enabled and pri_supported, to enable IOPF. A bit that says
> ++	 * "this device's page faults are handled out of band", called for
> ++	 * example master->oob_iopf. How to set it?  It can easily be a
> firmware
> ++	 * quirk, but that does not suffice in my opinion. We need to know
> that
> ++	 * there is software ready to handle these page faults. The device
> ++	 * driver owning this endpoint could for example call
> ++	 * iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_OOB_IOPF),
> before
> ++	 * enabling IOMMU_DEV_FEAT_SVA.
> ++	 */
> ++	return true;
> + }
> +
> + static void arm_smmu_enable_ats(struct arm_smmu_master *master)
> +--
> +2.25.0
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-
> arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-
> add-acs-override-for-PCI-devices.patch
> new file mode 100644
> index 0000000..a66083a
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-
> +++ pci_quirk-add-acs-override-for-PCI-devices.patch
> @@ -0,0 +1,156 @@
> +From 224e4adc6bc6a23f5deb3e1ebea03a85e3cad606 Mon Sep 17 00:00:00
> 2001
> +From: Manoj Kumar <manoj.kumar3@arm.com>
> +Date: Mon, 3 Feb 2020 10:11:19 +0000
> +Subject: [PATCH 2/4] pci_quirk: add acs override for PCI devices
> +
> +Patch taken from:
> +https://gitlab.com/Queuecumber/linux-acs-
> override/raw/master/workspaces
> +/5.4/acso.patch
> +
> +Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
> +---
> + .../admin-guide/kernel-parameters.txt         |   9 ++
> + drivers/pci/quirks.c                          | 101 ++++++++++++++++++
> + 2 files changed, 110 insertions(+)
> +
> +diff --git a/Documentation/admin-guide/kernel-parameters.txt
> +b/Documentation/admin-guide/kernel-parameters.txt
> +index 8d7932502edc..f2be8337e98c 100644
> +--- a/Documentation/admin-guide/kernel-parameters.txt
> ++++ b/Documentation/admin-guide/kernel-parameters.txt
> +@@ -3423,6 +3423,15 @@
> + 		nomsi		[MSI] If the PCI_MSI kernel config parameter
> is
> + 				enabled, this kernel boot option can be used
> to
> + 				disable the use of MSI interrupts system-wide.
> ++		pcie_acs_override =3D
> ++					[PCIE] Override missing PCIe ACS
> support for:
> ++				downstream
> ++					All downstream ports - full ACS
> capabilities
> ++				multfunction
> ++					All multifunction devices -
> multifunction ACS subset
> ++				id:nnnn:nnnn
> ++					Specfic device - full ACS capabilities
> ++					Specified as vid:did (vendor/device ID)
> in hex
> + 		noioapicquirk	[APIC] Disable all boot interrupt quirks.
> + 				Safety option to keep boot IRQs enabled. This
> + 				should never be necessary.
> +diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c index
> +d134e12aab9d..9067bc7833be 100644
> +--- a/drivers/pci/quirks.c
> ++++ b/drivers/pci/quirks.c
> +@@ -3494,6 +3494,106 @@ static void quirk_no_bus_reset(struct pci_dev
> *dev)
> + 	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;  }
> +
> ++static bool acs_on_downstream;
> ++static bool acs_on_multifunction;
> ++
> ++#define NUM_ACS_IDS 16
> ++struct acs_on_id {
> ++	unsigned short vendor;
> ++	unsigned short device;
> ++};
> ++static struct acs_on_id acs_on_ids[NUM_ACS_IDS]; static u8 max_acs_id;
> ++
> ++static __init int pcie_acs_override_setup(char *p) {
> ++	if (!p)
> ++		return -EINVAL;
> ++
> ++	while (*p) {
> ++		if (!strncmp(p, "downstream", 10))
> ++			acs_on_downstream =3D true;
> ++		if (!strncmp(p, "multifunction", 13))
> ++			acs_on_multifunction =3D true;
> ++		if (!strncmp(p, "id:", 3)) {
> ++			char opt[5];
> ++			int ret;
> ++			long val;
> ++
> ++			if (max_acs_id >=3D NUM_ACS_IDS - 1) {
> ++				pr_warn("Out of PCIe ACS override slots
> (%d)\n",
> ++						NUM_ACS_IDS);
> ++				goto next;
> ++			}
> ++
> ++			p +=3D 3;
> ++			snprintf(opt, 5, "%s", p);
> ++			ret =3D kstrtol(opt, 16, &val);
> ++			if (ret) {
> ++				pr_warn("PCIe ACS ID parse error %d\n", ret);
> ++				goto next;
> ++			}
> ++			acs_on_ids[max_acs_id].vendor =3D val;
> ++
> ++			p +=3D strcspn(p, ":");
> ++			if (*p !=3D ':') {
> ++				pr_warn("PCIe ACS invalid ID\n");
> ++				goto next;
> ++			}
> ++
> ++			p++;
> ++			snprintf(opt, 5, "%s", p);
> ++			ret =3D kstrtol(opt, 16, &val);
> ++			if (ret) {
> ++				pr_warn("PCIe ACS ID parse error %d\n", ret);
> ++				goto next;
> ++			}
> ++			acs_on_ids[max_acs_id].device =3D val;
> ++			max_acs_id++;
> ++		}
> ++next:
> ++		p +=3D strcspn(p, ",");
> ++		if (*p =3D=3D ',')
> ++			p++;
> ++	}
> ++
> ++	if (acs_on_downstream || acs_on_multifunction || max_acs_id)
> ++		pr_warn("Warning: PCIe ACS overrides enabled; This may
> allow
> ++non-IOMMU protected peer-to-peer DMA\n");
> ++
> ++	return 0;
> ++}
> ++early_param("pcie_acs_override", pcie_acs_override_setup);
> ++
> ++static int pcie_acs_overrides(struct pci_dev *dev, u16 acs_flags) {
> ++	int i;
> ++
> ++	/* Never override ACS for legacy devices or devices with ACS caps */
> ++	if (!pci_is_pcie(dev) ||
> ++		pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS))
> ++			return -ENOTTY;
> ++
> ++	for (i =3D 0; i < max_acs_id; i++)
> ++		if (acs_on_ids[i].vendor =3D=3D dev->vendor &&
> ++			acs_on_ids[i].device =3D=3D dev->device)
> ++				return 1;
> ++
> ++	switch (pci_pcie_type(dev)) {
> ++	case PCI_EXP_TYPE_DOWNSTREAM:
> ++	case PCI_EXP_TYPE_ROOT_PORT:
> ++		if (acs_on_downstream)
> ++			return 1;
> ++		break;
> ++	case PCI_EXP_TYPE_ENDPOINT:
> ++	case PCI_EXP_TYPE_UPSTREAM:
> ++	case PCI_EXP_TYPE_LEG_END:
> ++	case PCI_EXP_TYPE_RC_END:
> ++		if (acs_on_multifunction && dev->multifunction)
> ++			return 1;
> ++	}
> ++
> ++	return -ENOTTY;
> ++}
> + /*
> +  * Some Atheros AR9xxx and QCA988x chips do not behave after a bus
> reset.
> +  * The device will throw a Link Down error on AER-capable systems and
> +@@ -4674,6 +4774,7 @@ static const struct pci_dev_acs_enabled {
> + 	{ PCI_VENDOR_ID_BROADCOM, 0xD714, pci_quirk_brcm_acs },
> + 	/* Amazon Annapurna Labs */
> + 	{ PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031,
> pci_quirk_al_acs },
> ++   { PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
> + 	{ 0 }
> + };
> +
> +--
> +2.25.0
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-
> platform.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-
> platform.patch
> new file mode 100644
> index 0000000..d827e9d
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-
> +++ pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
> @@ -0,0 +1,318 @@
> +From 813f6c6015c75caf25553cd2e36361bac9151145 Mon Sep 17 00:00:00
> 2001
> +From: Deepak Pandey <Deepak.Pandey@arm.com>
> +Date: Mon, 9 Dec 2019 16:06:38 +0000
> +Subject: [PATCH 3/4] pcie: Add quirk for the Arm Neoverse N1SDP
> +platform
> +
> +The Arm N1SDP SoC suffers from some PCIe integration issues, most
> +prominently config space accesses to not existing BDFs being answered
> +with a bus abort, resulting in an SError.
> +To mitigate this, the firmware scans the bus before boot (catching the
> +SErrors) and creates a table with valid BDFs, which acts as a filter
> +for Linux' config space accesses.
> +
> +Add code consulting the table as an ACPI PCIe quirk, also register the
> +corresponding device tree based description of the host controller.
> +Also fix the other two minor issues on the way, namely not being fully
> +ECAM compliant and config space accesses being restricted to 32-bit
> +accesses only.
> +
> +This allows the Arm Neoverse N1SDP board to boot Linux without crashing
> +and to access *any* devices (there are no platform devices except UART).
> +
> +Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
> +[Sudipto: extend to cover the CCIX root port as well]
> +Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
> +[Andre: fix coding style issues, rewrite some parts, add DT support]
> +Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> +---
> + arch/arm64/configs/defconfig        |   1 +
> + drivers/acpi/pci_mcfg.c             |   7 +
> + drivers/pci/controller/Kconfig      |  11 ++
> + drivers/pci/controller/Makefile     |   1 +
> + drivers/pci/controller/pcie-n1sdp.c | 196 ++++++++++++++++++++++++++++
> + include/linux/pci-ecam.h            |   2 +
> + 6 files changed, 218 insertions(+)
> + create mode 100644 drivers/pci/controller/pcie-n1sdp.c
> +
> +diff --git a/arch/arm64/configs/defconfig
> +b/arch/arm64/configs/defconfig index 619a892148fb..56f00e82a4c4 100644
> +--- a/arch/arm64/configs/defconfig
> ++++ b/arch/arm64/configs/defconfig
> +@@ -177,6 +177,7 @@ CONFIG_NET_9P=3Dy
> + CONFIG_NET_9P_VIRTIO=3Dy
> + CONFIG_PCI=3Dy
> + CONFIG_PCIEPORTBUS=3Dy
> ++CONFIG_PCI_QUIRKS=3Dy
> + CONFIG_PCI_IOV=3Dy
> + CONFIG_HOTPLUG_PCI=3Dy
> + CONFIG_HOTPLUG_PCI_ACPI=3Dy
> +diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c index
> +6b347d9920cc..7a2b41b9ab57 100644
> +--- a/drivers/acpi/pci_mcfg.c
> ++++ b/drivers/acpi/pci_mcfg.c
> +@@ -142,6 +142,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
> + 	XGENE_V2_ECAM_MCFG(4, 0),
> + 	XGENE_V2_ECAM_MCFG(4, 1),
> + 	XGENE_V2_ECAM_MCFG(4, 2),
> ++
> ++#define N1SDP_ECAM_MCFG(rev, seg, ops) \
> ++	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
> ++
> ++	/* N1SDP SoC with v1 PCIe controller */
> ++	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
> ++	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
> + };
> +
> + static char mcfg_oem_id[ACPI_OEM_ID_SIZE]; diff --git
> +a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig index
> +70e078238899..03860176e339 100644
> +--- a/drivers/pci/controller/Kconfig
> ++++ b/drivers/pci/controller/Kconfig
> +@@ -65,6 +65,17 @@ config PCI_FTPCI100
> + 	depends on OF
> + 	default ARCH_GEMINI
> +
> ++config PCIE_HOST_N1SDP_ECAM
> ++	bool "ARM N1SDP PCIe Controller"
> ++	depends on ARM64
> ++	depends on OF || (ACPI && PCI_QUIRKS)
> ++	select PCI_HOST_COMMON
> ++	default y if ARCH_VEXPRESS
> ++	help
> ++	  Say Y here if you want PCIe support for the Arm N1SDP platform.
> ++	  The controller is ECAM compliant, but needs a quirk to workaround
> ++	  an integration issue.
> ++
> + config PCI_TEGRA
> + 	bool "NVIDIA Tegra PCIe controller"
> + 	depends on ARCH_TEGRA || COMPILE_TEST diff --git
> +a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
> +index a2a22c9d91af..7ea98c5a04ec 100644
> +--- a/drivers/pci/controller/Makefile
> ++++ b/drivers/pci/controller/Makefile
> +@@ -30,6 +30,7 @@ obj-$(CONFIG_PCIE_MEDIATEK) +=3D pcie-mediatek.o
> + obj-$(CONFIG_PCIE_MOBIVEIL) +=3D pcie-mobiveil.o
> + obj-$(CONFIG_PCIE_TANGO_SMP8759) +=3D pcie-tango.o
> + obj-$(CONFIG_VMD) +=3D vmd.o
> ++obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) +=3D pcie-n1sdp.o
> + # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
> + obj-y				+=3D dwc/
> +
> +diff --git a/drivers/pci/controller/pcie-n1sdp.c
> +b/drivers/pci/controller/pcie-n1sdp.c
> +new file mode 100644
> +index 000000000000..620ab221466c
> +--- /dev/null
> ++++ b/drivers/pci/controller/pcie-n1sdp.c
> +@@ -0,0 +1,196 @@
> ++// SPDX-License-Identifier: GPL-2.0
> ++/*
> ++ * Copyright (C) 2018/2019 ARM Ltd.
> ++ *
> ++ * This quirk is to mask the following issues:
> ++ * - PCIE SLVERR: config space accesses to invalid PCIe BDFs cause a bu=
s
> ++ *		  error (signalled as an asynchronous SError)
> ++ * - MCFG BDF mapping: the root complex is mapped separately from the
> device
> ++ *		       config space
> ++ * - Non 32-bit accesses to config space are not supported.
> ++ *
> ++ * At boot time the SCP board firmware creates a discovery table with
> ++ * the root complex' base address and the valid BDF values, discovered
> ++while
> ++ * scanning the config space and catching the SErrors.
> ++ * Linux responds only to the EPs listed in this table, returning NULL
> ++ * for the rest.
> ++ */
> ++
> ++#include <linux/kernel.h>
> ++#include <linux/init.h>
> ++#include <linux/ioport.h>
> ++#include <linux/sizes.h>
> ++#include <linux/of_pci.h>
> ++#include <linux/of.h>
> ++#include <linux/pci-ecam.h>
> ++#include <linux/platform_device.h>
> ++#include <linux/module.h>
> ++
> ++/* Platform specific values as hardcoded in the firmware. */
> ++#define AP_NS_SHARED_MEM_BASE	0x06000000
> ++#define MAX_SEGMENTS		2		/* Two PCIe root
> complexes. */
> ++#define BDF_TABLE_SIZE		SZ_16K
> ++
> ++/*
> ++ * Shared memory layout as written by the SCP upon boot time:
> ++ *  ----
> ++ *  Discover data header --> RC base address
> ++ *                       \-> BDF Count
> ++ *  Discover data        --> BDF 0...n
> ++ *  ----
> ++ */
> ++struct pcie_discovery_data {
> ++	u32 rc_base_addr;
> ++	u32 nr_bdfs;
> ++	u32 valid_bdfs[0];
> ++} *pcie_discovery_data[MAX_SEGMENTS];
> ++
> ++void __iomem *rc_remapped_addr[MAX_SEGMENTS];
> ++
> ++/*
> ++ * map_bus() is called before we do a config space access for a
> ++certain
> ++ * device. We use this to check whether this device is valid, avoiding
> ++ * config space accesses which would result in an SError otherwise.
> ++ */
> ++static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned
> int devfn,
> ++				       int where)
> ++{
> ++	struct pci_config_window *cfg =3D bus->sysdata;
> ++	unsigned int devfn_shift =3D cfg->ops->bus_shift - 8;
> ++	unsigned int busn =3D bus->number;
> ++	unsigned int segment =3D bus->domain_nr;
> ++	unsigned int bdf_addr;
> ++	unsigned int table_count, i;
> ++
> ++	if (segment >=3D MAX_SEGMENTS ||
> ++	    busn < cfg->busr.start || busn > cfg->busr.end)
> ++		return NULL;
> ++
> ++	/* The PCIe root complex has a separate config space mapping. */
> ++	if (busn =3D=3D 0 && devfn =3D=3D 0)
> ++		return rc_remapped_addr[segment] + where;
> ++
> ++	busn -=3D cfg->busr.start;
> ++	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
> ++	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
> ++	for (i =3D 0; i < table_count; i++) {
> ++		if (bdf_addr =3D=3D pcie_discovery_data[segment]->valid_bdfs[i])
> ++			return pci_ecam_map_bus(bus, devfn, where);
> ++	}
> ++
> ++	return NULL;
> ++}
> ++
> ++static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int
> ++segment) {
> ++	phys_addr_t table_base;
> ++	struct device *dev =3D cfg->parent;
> ++	struct pcie_discovery_data *shared_data;
> ++	size_t bdfs_size;
> ++
> ++	if (segment >=3D MAX_SEGMENTS)
> ++		return -ENODEV;
> ++
> ++	table_base =3D AP_NS_SHARED_MEM_BASE + segment *
> BDF_TABLE_SIZE;
> ++
> ++	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
> ++				"PCIe valid BDFs")) {
> ++		dev_err(dev, "PCIe BDF shared region request failed\n");
> ++		return -ENOMEM;
> ++	}
> ++
> ++	shared_data =3D devm_ioremap(dev,
> ++				   table_base, BDF_TABLE_SIZE);
> ++	if (!shared_data)
> ++		return -ENOMEM;
> ++
> ++	/* Copy the valid BDFs structure to allocated normal memory. */
> ++	bdfs_size =3D sizeof(struct pcie_discovery_data) +
> ++		    sizeof(u32) * shared_data->nr_bdfs;
> ++	pcie_discovery_data[segment] =3D devm_kmalloc(dev, bdfs_size,
> GFP_KERNEL);
> ++	if (!pcie_discovery_data[segment])
> ++		return -ENOMEM;
> ++
> ++	memcpy_fromio(pcie_discovery_data[segment], shared_data,
> bdfs_size);
> ++
> ++	rc_remapped_addr[segment] =3D devm_ioremap_nocache(dev,
> ++						shared_data->rc_base_addr,
> ++						PCI_CFG_SPACE_EXP_SIZE);
> ++	if (!rc_remapped_addr[segment]) {
> ++		dev_err(dev, "Cannot remap root port base\n");
> ++		return -ENOMEM;
> ++	}
> ++
> ++	devm_iounmap(dev, shared_data);
> ++
> ++	return 0;
> ++}
> ++
> ++static int pci_n1sdp_pcie_init(struct pci_config_window *cfg) {
> ++	return pci_n1sdp_init(cfg, 0);
> ++}
> ++
> ++static int pci_n1sdp_ccix_init(struct pci_config_window *cfg) {
> ++	return pci_n1sdp_init(cfg, 1);
> ++}
> ++
> ++struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
> ++	.bus_shift	=3D 20,
> ++	.init		=3D pci_n1sdp_pcie_init,
> ++	.pci_ops	=3D {
> ++		.map_bus        =3D pci_n1sdp_map_bus,
> ++		.read           =3D pci_generic_config_read32,
> ++		.write          =3D pci_generic_config_write32,
> ++	}
> ++};
> ++
> ++struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D {
> ++	.bus_shift	=3D 20,
> ++	.init		=3D pci_n1sdp_ccix_init,
> ++	.pci_ops	=3D {
> ++		.map_bus        =3D pci_n1sdp_map_bus,
> ++		.read           =3D pci_generic_config_read32,
> ++		.write          =3D pci_generic_config_write32,
> ++	}
> ++};
> ++
> ++static const struct of_device_id n1sdp_pcie_of_match[] =3D {
> ++	{ .compatible =3D "arm,n1sdp-pcie" },
> ++	{ },
> ++};
> ++MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
> ++
> ++static int n1sdp_pcie_probe(struct platform_device *pdev) {
> ++	const struct device_node *of_node =3D pdev->dev.of_node;
> ++	u32 segment;
> ++
> ++	if (of_property_read_u32(of_node, "linux,pci-domain", &segment)) {
> ++		dev_err(&pdev->dev, "N1SDP PCI controllers require
> linux,pci-domain property\n");
> ++		return -EINVAL;
> ++	}
> ++
> ++	switch (segment) {
> ++	case 0:
> ++		return pci_host_common_probe(pdev,
> &pci_n1sdp_pcie_ecam_ops);
> ++	case 1:
> ++		return pci_host_common_probe(pdev,
> &pci_n1sdp_ccix_ecam_ops);
> ++	}
> ++
> ++	dev_err(&pdev->dev, "Invalid segment number, must be smaller
> than %d\n",
> ++		MAX_SEGMENTS);
> ++
> ++	return -EINVAL;
> ++}
> ++
> ++static struct platform_driver n1sdp_pcie_driver =3D {
> ++	.driver =3D {
> ++		.name =3D KBUILD_MODNAME,
> ++		.of_match_table =3D n1sdp_pcie_of_match,
> ++		.suppress_bind_attrs =3D true,
> ++	},
> ++	.probe =3D n1sdp_pcie_probe,
> ++};
> ++builtin_platform_driver(n1sdp_pcie_driver);
> +diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h index
> +a73164c85e78..03cdea69f4e8 100644
> +--- a/include/linux/pci-ecam.h
> ++++ b/include/linux/pci-ecam.h
> +@@ -57,6 +57,8 @@ extern struct pci_ecam_ops pci_thunder_ecam_ops;
> /*
> +Cavium ThunderX 1.x */  extern struct pci_ecam_ops
> +xgene_v1_pcie_ecam_ops; /* APM X-Gene PCIe v1 */  extern struct
> +pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x */
> extern
> +struct pci_ecam_ops al_pcie_ops; /* Amazon Annapurna Labs PCIe */
> ++extern struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP
> PCIe
> ++*/ extern struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP
> ++PCIe */
> + #endif
> +
> + #ifdef CONFIG_PCI_HOST_COMMON
> +--
> +2.25.0
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-
> 5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
> b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-
> n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
> new file mode 100644
> index 0000000..6fb2dac
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-
> +++ n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
> @@ -0,0 +1,51 @@
> +From 7bcc0412428050b0ab1fd70cbb4aaead5ac3c0e5 Mon Sep 17 00:00:00
> 2001
> +From: Manoj Kumar <manoj.kumar3@arm.com>
> +Date: Wed, 29 Jan 2020 17:21:39 +0000
> +Subject: [PATCH 4/4] n1sdp: update n1sdp pci quirk for SR-IOV support
> +
> +VFs are not probing the vendor ID first, which is otherwise the gate
> +keeper for undiscovered devices. So any accesses using a config space
> +offset greater than 0 must be coming for an already discovered device
> +or from a VF that has just been created.
> +
> +Also if Linux already has a struct pci_dev* for a given BDF, this
> +device is safe to access.
> +
> +Skip the firmware table in these cases and allow accesses to those
> +devices. That enables SR-IOV support on the N1SDP board.
> +
> +Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> +---
> + drivers/pci/controller/pcie-n1sdp.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/drivers/pci/controller/pcie-n1sdp.c
> +b/drivers/pci/controller/pcie-n1sdp.c
> +index 620ab221466c..04c0de043817 100644
> +--- a/drivers/pci/controller/pcie-n1sdp.c
> ++++ b/drivers/pci/controller/pcie-n1sdp.c
> +@@ -61,6 +61,7 @@ static void __iomem *pci_n1sdp_map_bus(struct
> pci_bus *bus, unsigned int devfn,
> + 	unsigned int segment =3D bus->domain_nr;
> + 	unsigned int bdf_addr;
> + 	unsigned int table_count, i;
> ++	struct pci_dev *dev;
> +
> + 	if (segment >=3D MAX_SEGMENTS ||
> + 	    busn < cfg->busr.start || busn > cfg->busr.end) @@ -70,6 +71,14
> +@@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus,
> unsigned int devfn,
> + 	if (busn =3D=3D 0 && devfn =3D=3D 0)
> + 		return rc_remapped_addr[segment] + where;
> +
> ++	dev =3D pci_get_domain_bus_and_slot(segment, busn, devfn);
> ++	if (dev && dev->is_virtfn)
> ++		return pci_ecam_map_bus(bus, devfn, where);
> ++
> ++	/* Accesses beyond the vendor ID always go to existing devices. */
> ++	if (where > 0)
> ++		return pci_ecam_map_bus(bus, devfn, where);
> ++
> + 	busn -=3D cfg->busr.start;
> + 	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
> + 	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
> +--
> +2.25.0
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> new file mode 100644
> index 0000000..56e0f15
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -0,0 +1,18 @@
> +# Add support for Arm Linaro Kernel 5.4 for Arm Platforms (boards or
> +simulators)
> +
> +SUMMARY =3D "Linux Kernel Upstream, supported by Arm/Linaro"
> +LICENSE =3D "GPLv2"
> +SECTION =3D "kernel"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +COMPATIBLE_MACHINE ?=3D ""

We should keep consistency with trusted-firmware-a and optee recipes and us=
e the "invalid" word.

> +
> +# KBRANCH is set to n1sdp by default as there is no master branch on
> +the repository KBRANCH =3D "n1sdp"
> +
> +SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/kernel-
> release.git;branch=3D${KBRANCH};"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
> +
> +SRCREV =3D "${AUTOREV}"
> +LINUX_VERSION ?=3D "${PV}"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-
> arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-
> arm_5.4.bbappend
> new file mode 100644
> index 0000000..e2ba6ae
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> @@ -0,0 +1,25 @@
> +#
> +# N1SDP MACHINE specific configurations #
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
> +
> +# Apply N1SDP specific patches
> +SRC_URI_append_n1sdp =3D " \
> +    file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
> +    file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
> +    file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
> +    file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
> +    "
> +
> +# Referring to commit TAG N1SDP-2020.03.26 SRCREV_n1sdp  =3D
> +"137cccb0843e63b031acf67d1ca4f6447b8c417c"
> +
> +# Use intree defconfig
> +KBUILD_DEFCONFIG_n1sdp =3D "defconfig"
> +
> +# Since the intree defconfig in n1sdp kernel repository is not setting
> +all the configs, # KCONFIG_MODE is set to "alldefconfig" to properly exp=
and
> the defconfig.
> +KCONFIG_MODE_n1sdp =3D "--alldefconfig"
> +
> +COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
> --
> 2.17.1

