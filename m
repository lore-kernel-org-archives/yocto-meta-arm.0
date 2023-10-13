Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EE6CDB485
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:05:31 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.42717.1697213121703440945
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 09:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hkOkDBwb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-66cfd874520so13438986d6.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697213120; x=1697817920; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4g6M3bvHwVBiK+Li9aDvMZzPPuCgj/gdLl0XxpQSiM=;
        b=hkOkDBwbSLx0eBX2uct92kkc64vmgCSgu2FSyfrR4EsjGAGMeOX4lS1CRcbN6XTiqF
         Hug83plt8Uz4nSplLZCBs+NSuz9KiMDUtWlBxJpKpuxji9bVGI/j78tR0UQug7nzou+y
         XDwWJ9y5D+HqB6sqSwChPVX11ixAIxUvz5OfwMlQUAGvDXeFBXjBCJy7vck4ve4TXZLL
         Yv0nbWIH5226BnbtzNKiYVwvNxwoyAGXG4POjZDLbYM/IB6Nm3y6mNACAdciF3/r8DYG
         35uLzJmh55yWHFALx6+P2m1ecOZXr9QgOLOmsksZ/l/1pv/Kukb1bRjGC8Gs0BTzk8kC
         eIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697213120; x=1697817920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4g6M3bvHwVBiK+Li9aDvMZzPPuCgj/gdLl0XxpQSiM=;
        b=V13LVRi6s46jo0urXNc/STIYNhjqRT3BcPScTV578MnyAzx7r05lPGOHLZfcYdc7FT
         xkmG/7DfuKHMVhqrVrKwRfXNyQ2IrN0ngsTKlJY718nj1jtavTHgqqhqrjIIk+aB8Uxg
         MLzeikxUOftFFvwonmftOCpUUgDxmJeaRT4k6NyF44GEbx77Q08vcEZskAxxT5lGovuG
         OWqvqkyy7oZCXaef9Kjkx56fgekwWPYu9Pci0j3BYT+TE0TkFza7Zqz/b++v1Qkf2GZA
         qkujCF4MhDjkW24nrTPRRmLUhidvI81781zDgubNRorhB1gKrqP0T5L74cfk9Dv0R/1w
         XEaw==
X-Gm-Message-State: AOJu0YwXLM9MsDIZ9sWQmwdrxfcntdPI6DO98H0gGfycYrOccGahpaN1
	AxMRS4m9lmgswO+Zxqc4nHsOmO6ta75h89fu8iw=
X-Google-Smtp-Source: AGHT+IGPqB2UmTZhhxz5cGUrIvad6jMXvqpePbk8g9uJqCmeo/C0ezIo9cdV6sr+HgEyypAVnZMasA==
X-Received: by 2002:a05:6214:5585:b0:668:ef6a:7664 with SMTP id mi5-20020a056214558500b00668ef6a7664mr27369074qvb.33.1697213120261;
        Fri, 13 Oct 2023 09:05:20 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id m1-20020ad44481000000b0066d1e20455bsm759905qvt.96.2023.10.13.09.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 09:05:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2] arm-bsp/linux-yocto: add recipe for v6.4 kernel
Date: Fri, 13 Oct 2023 12:03:17 -0400
Message-Id: <169721299737.1302487.12052606184599515365.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231013155633.3896081-1-jon.mason@arm.com>
References: <20231013155633.3896081-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 16:05:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5120


On Fri, 13 Oct 2023 10:56:33 -0500, Jon Mason wrote:
> The v6.4 kernel is needed for some platforms in meta-arm-bsp.
> Temporarily add it here to give those machines enough time to
> update to the latest version.  Also, add the patch to the
> defconfig.
> 
> 

Applied, thanks!

[1/1] arm-bsp/linux-yocto: add recipe for v6.4 kernel
      commit: 07dbfed721a571d45a07c55ad7464d4b5fd26465

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

