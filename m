Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E1EC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 12:46:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.5916.1667306760112120386
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 05:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=wjBX9qtS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id z6so9173382qtv.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Nov 2022 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQ5szXDyXMI/9IMiDT8e4nkUS/AhaoTvnHJJTgdyZTk=;
        b=wjBX9qtSy9tMh0iHxnyERjxR/4MddvzCX+4MkGaPg+jXT+Fpgpt5xd0eXd9CH/F9on
         AgvNAq/fMfoN1sXokrg/CEFLF9SVJpwVT5ZKoJxDUm1uRKMJoiryWkm8FpDfg6IEm90Q
         O5rESJE2CNthwI8aaJnq2lmXwL1SiS1996rf+tLDr1PQrxDPCnZFoFAuVNx8kKgfvQmw
         YULqvZE3q8viC2rdAuqAw+FnOlQH/Z2qSZPHYRCgPpabmeWSLT1DAyjK/O0oN2L/Tfdp
         KmDHp8Wg/MtHlnEYpBZQZuC7NEVXdzR1aOqix2xnzfhEOueZ+vGdmwwwfxpK/oVffyOc
         7gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQ5szXDyXMI/9IMiDT8e4nkUS/AhaoTvnHJJTgdyZTk=;
        b=L7/nnyc9OpelG9WZMgGbz8YowMuS7oo+vnh4tdyTwULq6GH9HIqkOoWdhfx0tZOXxO
         EYsi+xLIXbt345c8VuLX7PAGfXYVwxOZ5TXBmrw8wFmb5JVgFWKyzw2d1OifVAntmCQb
         uupk/nDEivoLAT2X+DvqwTpcpcR43yghAGn8CQCirbcDDiqOik78arUbqpf46kYFGD25
         gsfV6COqYEpV4NRd84I08Y2YQSESk2JKFRRI2erW7hbB7qh0AO0QZnsamdtR8DDh5zBf
         GArb7oJKebzumeqakVvoWnbqf1pxgmo5Uif7NiyofjHRx2QL5r2S3gLPLBFmDBvLRpOU
         CNUQ==
X-Gm-Message-State: ACrzQf2jwRYdu+NIMQKpciGPcd6LPMx3YruDXikTUvi07jc1dcHPlzVW
	9QX2FSxdw35O/0vRJfo3bkrix6CBZBlvJg==
X-Google-Smtp-Source: AMsMyM63yElsy5kV3MYJtzZRy/R8fK8mhyHxGPl05jDhKmDfqwQB448ldHnfQq1PgSnhgky51sCk3A==
X-Received: by 2002:ac8:6742:0:b0:3a5:1ba1:b80a with SMTP id n2-20020ac86742000000b003a51ba1b80amr11821369qtp.571.1667306758792;
        Tue, 01 Nov 2022 05:45:58 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id ay7-20020a05620a178700b006cfc1d827cbsm6429028qkb.9.2022.11.01.05.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:45:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: Add packages for opencsd and gator-daemon to base build
Date: Tue,  1 Nov 2022 08:45:52 -0400
Message-Id: <166730675369.4073097.16834965635351961312.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221028142330.23482-1-jon.mason@arm.com>
References: <20221028142330.23482-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Nov 2022 12:46:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4067

On Fri, 28 Oct 2022 10:23:30 -0400, Jon Mason wrote:
> opencsd and gator-daemon aren't currently being build.  Add them to the
> base build so that they can be verified to at least compile.

Applied, thanks!

[1/1] CI: Add packages for opencsd and gator-daemon to base build
      commit: 49b23ff619eb10521fdb58faae2c4d8a1942909c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

