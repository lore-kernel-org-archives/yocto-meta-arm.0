Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2C5C00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 20:48:25 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.12081.1658868497439818334
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=TI32as8I;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id mz20so11558367qvb.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 13:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xBffOerz5OFrDDR/4+UddBJXbGhpYjDIPiPy4dJhFLk=;
        b=TI32as8INfPnt3Fu8slMXDsvCQKYWvw5zeqETgS+tEv+ZuhmycH+VjDszXH5RJj3Ld
         hru0C62B9wCrIZyoVZxGg/HWaY+SrBzYT0I7C/Mup3388JJ6ApvJ66oGDAm/1F96n0ZX
         RMiR+doABDTqyMfVNI59n08jufeKaVkLP9FKZ7va3dQ2kmwgX1Az7/m9+djXMHbVVsqj
         YHleE0Ulo+iqQEt0oZdUSop4gfCtjYUltkrLvKP5c/D/YppxH+cPfgCplC610LyedsP5
         tZaH5VqYJZ9dhV+xchwcOZpa+VhCpWDj6shED4uD8po/yxUlVHlf/sOzwGo69zjhye2A
         0sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBffOerz5OFrDDR/4+UddBJXbGhpYjDIPiPy4dJhFLk=;
        b=meZmBUA9QJ08a+65lqZVvnMfIcBByQEm+LiZFikyXLTqgxquEMlvWJfPencLrCMrG+
         xrdfDOQltOZdTG/mW+DCVMs0BySEJF6TiXKvkUS8wehRIn8fFMgVZvhWGQFFzd3eowUi
         FZbL0Pz2iA6o+gWpFOuhPcklIDbIUF5e3q71PFEZEkW/RqI4yMaEaHgYVGvKu3JfihLN
         vPCraK2gvh3XgeAndexnVjQvMn0H32svjHYKL1Gn877mvE40mUbzCQ7taMVU0/xf1zq4
         liZ7iajYzKUYjSdMMZv2NKr3R7PgT9CB3A/v3umbnkh1/NY1tt240yFKDNnGvsBQO3HC
         Nd8g==
X-Gm-Message-State: AJIora+pglsygThnOyRP5eaXRn1TNjYb1F/W3l4xDyuOaNzwp//Lp0Ns
	PYVnKk54UNcsNN1SzHlUVXciLf2TE+tSKA==
X-Google-Smtp-Source: 
 AGRyM1v0FJqZyLeVGTSsx1tU/w01zbeTWfOyY7pe3NYDCnfRbLZWkdtHLem6ROAP0OqPC3TFQvq9+Q==
X-Received: by 2002:a0c:e50d:0:b0:474:6b1e:ff39 with SMTP id
 l13-20020a0ce50d000000b004746b1eff39mr3718780qvm.2.1658868496014;
        Tue, 26 Jul 2022 13:48:16 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h26-20020ac8549a000000b0031f41ea94easm1415646qtq.28.2022.07.26.13.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 13:48:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp: add u-boot v2022.04 support
Date: Tue, 26 Jul 2022 16:48:00 -0400
Message-Id: <165886848111.1179859.13374542045628282606.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220722182216.3030-1-jon.mason@arm.com>
References: <20220722182216.3030-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 20:48:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3594

On Fri, 22 Jul 2022 14:22:16 -0400, Jon Mason wrote:
> Upstream has updated u-boot to v2022.07, but the update is causing
> problems with some machines.  Temporarily add a v2022.04 recipe until
> the issues can be resolved.

Applied, thanks!

[1/1] arm-bsp: add u-boot v2022.04 support
      commit: 64ddea94420fe8d1434ac1d4369b61646ddf0927

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

