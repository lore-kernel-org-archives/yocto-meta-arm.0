Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A39BC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 17:37:11 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.371.1666633026865896866
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 10:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Re9KjDtJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id 8so6524798qka.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElVIYMcHSAQEAzmlTKqdS45ASsrwrmMJ0kU80PeT4O4=;
        b=Re9KjDtJj2zFLI0xICqmR07EbIcJTyWy/Ii9au7/d9+9wbPM0nzCq20pBoFlvsj/w1
         I4qQKpNntUNWk/0YuRfjENfsC8ugbn7RrtVDXSYJ1zKNJTRUOrYPx3pltkZPcw53BZnK
         +GXlhYAhSxqMbv+vMuZ97xgBiS92SRW54xTTVo4lUXQo+AdjQRarskPcZEs3W6HuSQb1
         dU5PHXR3gXQABGFtilgCGJ6l3gzdiB5mbaIcnkmyPO3zPGeaOOqZm649+bY1DbtDl81O
         VdBgemC5M1L+EwzefC4HlIGAPwl0hDKAPCKFelggn2kUaLiQaNF1WbgpO6gpDfynXvO3
         Rziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElVIYMcHSAQEAzmlTKqdS45ASsrwrmMJ0kU80PeT4O4=;
        b=XFsFwgWapT0v0mXL8xA7sjwqAPdVl8dmpMBXJFyBXp51qGRAxSkXfz3Eh71L0kM6cE
         c3pKWqU2VjD14L73oqU0ZIe8fAxH28OPIVxHuwp/G+iz9zeToV9lpzevV5foFe934phf
         NXLJXKRYT/jEtYltajklnq+ybEFXDri2NsTyxFaimM3gYhtf3KLtkK8d74NS4nzkPgHl
         FRbqQgGXGpQyY1CP8tePreXNuw8gEd72U19vkRj0rgqwYfqdfYJJOKEWa4orZiv7vbnI
         PRd60ojEyGTx1TJaXI/sRL5l0nOf3S3X7k1Rx80MsUJvYL4kgQaBuqIbgKDEY95yh3l7
         eADA==
X-Gm-Message-State: ACrzQf2b2capCbDFNC6AvoF5IRVL9C7SyifU28UVijhLYmAhVIrWemfH
	5S8b42c3TCy2iYcitoX56AhAfFO9U2isjw==
X-Google-Smtp-Source: AMsMyM5CpN5t/6wtNOzHTtPhMLGBNYkC3Nr8pfwSKb0Sp8KpBevzzTD13T4KTolH6Y0hN0hAtUZLLw==
X-Received: by 2002:a05:620a:294f:b0:6ee:b598:2625 with SMTP id n15-20020a05620a294f00b006eeb5982625mr24398441qkp.415.1666633025525;
        Mon, 24 Oct 2022 10:37:05 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id x6-20020a05620a448600b006b9c9b7db8bsm356692qkp.82.2022.10.24.10.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:37:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: Remove host bitbake variables
Date: Mon, 24 Oct 2022 13:36:36 -0400
Message-Id: <166663299865.2899578.15507855852851608658.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221020140938.7171-1-jon.mason@arm.com>
References: <20221020140938.7171-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 17:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4031

On Thu, 20 Oct 2022 10:09:38 -0400, Jon Mason wrote:
> Bitbake variables were being set in KAS for the unique Gitlab CI
> configuration being used internally.  While this should not have been
> significantly detrimental for other setups, this shouldn't be necessary
> with proper runner setup.  Removing them here to all for a more generic
> CI experience.

Applied, thanks!

[1/1] CI: Remove host bitbake variables
      commit: d3541b1e29667ab386b8b87292e8d9d5760aaa3a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

