Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC17DC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 20:56:30 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.13132.1642193782089657562
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 12:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Yi6yGZf8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id l17so11986177qtk.7
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 12:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v5tGxkkAgxi0sRKbYXR0sz8r12B5KDoytXvLJugKYPc=;
        b=Yi6yGZf8vzG6h0Db/dtBhZEbFab0sUD2nrdVvvPPbbep8OTqfbjJEz3ZmiktV2XswI
         0p0X58E4FGZqo/zbIks0mWvw+2GqzCYSUiAbN8MksRoU8w+q9KM0MdnYXyxly214fxfV
         o0KTXezrKFAb/fNPgwnma5wHgnB0u+WsCFkPt/7fqNzkAaQ1RhPPgug3Q03d/2RYALgW
         1P/ohLvLnszwqjwuVojjxLPnT0pY5AiuZOCWIJAUhJ41/x4dt5LJN4l1OyRCm6mpx3PI
         iLjcQV0KeBdpO4kWYK+qvuAtLGkojOtsNhGxxbUocadWX0I3wxLOtvQLWfZl6D6NmGFs
         bcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5tGxkkAgxi0sRKbYXR0sz8r12B5KDoytXvLJugKYPc=;
        b=bBnnss/7nfyBXP6FExhmsx7b1IJjyZrdybhf9ExNdnqWUuDcD52GOaGdl3Rj8UF4QP
         P9H969BxWJkVEwKeoKHbldBMD05uJSEBYFzkOsvPf4elIbYR0B04bm2ZdGp4mldEDxzD
         eeR2L5RXQyfaBDDZGPJfu30qEh4EjLRf3I76Th1QZOtXhvBvlvrMQdkMpUbMOC0bs3/C
         THqMgAlLWRz43ynYWqYgoo4q4S+xuWlXLYCMTCbQhfXWWpCzuwG1F9CvgyJ6Gp2r3N7S
         qsQhMUWjYVNZ+7U7nEL9+DySr8TZCliSQrnI9QPYZ2fAo3Z9zj+xG/PoNqxs/iqaSouE
         FuRQ==
X-Gm-Message-State: AOAM533dIcsl5G7GxSbUEAbtSpTsCF4q5HJiWFqMjmceg89GFMfjq1P+
	2hr70lQKYmIXoVksiyC+vDALsvRGjq8pGg==
X-Google-Smtp-Source: 
 ABdhPJzfPl3BfytFy0ld7zL2YpM+4MKhlzviGen+IZTcwcBv/t+yebKhXMiVMdnvP4Q3JrNA4JytdQ==
X-Received: by 2002:a05:622a:164b:: with SMTP id
 y11mr9241808qtj.621.1642193781076;
        Fri, 14 Jan 2022 12:56:21 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:de4f:97a0:457b:40cf])
        by smtp.gmail.com with ESMTPSA id
 az35sm4266697qkb.97.2022.01.14.12.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 12:56:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH] arm-bsp/optee-os: total-compute: Exchange patches to fix
 managed-exit
Date: Fri, 14 Jan 2022 15:56:13 -0500
Message-Id: <164219377456.3112018.7767933808756726795.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114091148.5140-1-ben.horgan@arm.com>
References: <20220114091148.5140-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 20:56:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2832

On Fri, 14 Jan 2022 09:11:48 +0000, Ben Horgan wrote:
> 


Applied, thanks!

[1/1] arm-bsp/optee-os: total-compute: Exchange patches to fix managed-exit
      commit: 447b7059c97dd0655464f807418427b0ab806360

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

