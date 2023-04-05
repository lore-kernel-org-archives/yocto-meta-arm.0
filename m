Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FE1C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 22:28:41 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.144639.1680733719243244413
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 15:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=GxFNkL82;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id ga7so36506935qtb.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 15:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680733718; x=1683325718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFXD8W6NgKaoEs6BYkWKd6PrPiTvMr51Gv5nFH/oYds=;
        b=GxFNkL82v1emW8+ZfuICLxDHhOamlKHm5eFYruCbY624m//BqHYpa9FxzZuGeUJdr5
         ZU5VdGQeD2DKncnEz33+Cg/eBB5TV2uO4dNETYwHByiWbaHqLHDk0tbg3gCyrkag0zAa
         2cmOusAMoe6/gCGCrANpW/MvkdjjyXArClaviiH6ivvPebfjW6//wIh6JSHZlDZaml2I
         KGRUlg1iEwtK37V05AL5L+Oz/onsiBCKuKmu0SojP65pp3LkMvBpFRIwq4x0IljfxMQu
         3UI+9VDXNowver82PvEXsq/xj8uAzwP/JsFtARvxBO/nA/lmAhOuf6crbX/bWtk6ZoJZ
         JYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680733718; x=1683325718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFXD8W6NgKaoEs6BYkWKd6PrPiTvMr51Gv5nFH/oYds=;
        b=gIe25WWWrPkN0x6OFFR1DDLKvf01VvxZDKRD4RnyGfTBjdOghnNLSHrVwSpbco8kVf
         GzBADCxCPqPACd8Gg9xieZfhwtKjZrDu1C7Jc5MOnVfNLJW06aPr+e88J1Y+EztFeD1g
         xQB+7Z2Xexis79OsRxo4axNem/UpzVCq2T9uzm3jM9aJrRnpPuI7SaQe1LHG+n6o7wv+
         +zocq6Kxn4pCbL5am6f0cmMNTFeQpU2I5n1gfDm6Uqd0p0VZLNvwoGwic6m2jxNl8nyR
         P50Tq2VX3Nq/tbhId8fkOjAwmB3mveWrtU/91ACWGH7TZbqS2xRrA8fVeVlX4yVaejWR
         EiSQ==
X-Gm-Message-State: AAQBX9dHfvQQhinIGG1JroF1UF1WvsOzvSRz22582dWsUgHGVi4LWB1e
	Fvm8uB7PQ2gRPiq79rURcdgnqlSOQHkIfoOfejg=
X-Google-Smtp-Source: AKy350bX9Wjyvmy7z0IWj3dzRvFGkqb0W/Fw9A1OMzctdBay1ufVnneSJxstYCyd9VCEbOwXbl01uA==
X-Received: by 2002:ac8:5e49:0:b0:3e3:86d0:4ef8 with SMTP id i9-20020ac85e49000000b003e386d04ef8mr7981218qtx.28.1680733717927;
        Wed, 05 Apr 2023 15:28:37 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id o76-20020a37414f000000b007486052d731sm12991qka.10.2023.04.05.15.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 15:28:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm/scp-firmware: add recipe for 2.11
Date: Wed,  5 Apr 2023 18:08:37 -0400
Message-Id: <168073252006.3261602.13575364638142309480.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230405142355.1703355-1-ross.burton@arm.com>
References: <20230405142355.1703355-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 22:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4549

On Wed, 5 Apr 2023 15:23:53 +0100, Ross Burton wrote:
> The install task is subtly different as the ELF binaries are named .elf
> now, instead of having no extension.

Applied, thanks!

[1/3] arm/scp-firmware: add recipe for 2.11
      commit: 794c7bfd129abeb98fdb62d475e92700503079f5
[2/3] arm-bsp/scp-firmware: move all machines to SCP 2.11
      commit: 0e5f5ac81f198c7f8ea6fa6bc74aae750e873f99
[3/3] arm/scp-firmware: remove 2.10 recipe
      commit: 5a62ce85616befb4e6d61f9ee25e407e438a3392

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

