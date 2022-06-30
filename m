Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915E4C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 14:02:11 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.25698.1656597729353495202
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 07:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=fciMZI5g;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id c137so14457427qkg.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GJOnICo00liBrXnwmF3AhiAVIy5AOYCVijWt5E80b/U=;
        b=fciMZI5gVcU6OHa7HIciuH5O1adwFEHvlCGLwQrWJ5JE+7+Zo0g6D5UzV14n5S80An
         MXKnJwqYpwKOUXKnpkSICgrCOmMiIgCLftkLyUShGeAlrZgjlqIA01YEc++NCcCOZKZo
         bmffKL41hYRwi6h+5U03KSvWDnLMpebVX4STVd/QJJ7q9Ms28JiGzA6RyKu9LhaVW4b2
         BV11x6mxrQf6ghoB5nSmXJJGe7T3kmC9gYJ4PaMGjiDWemR5HdBl+uSzE4c6sYvu3Nms
         SRUUcL098c4TRKFAhSsOl4dDS8y3sp45Kl/WkTGXaKMOkTEJ1MrqR6Bv+kPzS93Q/k6O
         kAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJOnICo00liBrXnwmF3AhiAVIy5AOYCVijWt5E80b/U=;
        b=U2WwJQXXD68Mjw3phcFADhEOfY8p96dOzh+1AKSzJd6dpoVm2+4sy5vc4E4WUF6GUP
         giGjFxL8FKKLq2XRUun/5q/B3oD9BzSviKtMU5ooaYphv18FD4iTT7eUdrkjd+b40skZ
         5Xcg655qTgExaapu/R/mhQj9/DG0+Iz2BCwER/T1nn0zw7TBTEudquMXGkn4BaxIXN3T
         y6CAXSz53g1eh2S4FmyFTAxBWE3j6bAQ4V8Z04AbFbxUBHLhMdow/LdXx7l6/uNkZ7Vq
         Vre84vO5ZExBdIBbn+47eKFNjAYF4UgibP5SfB4+4Cp8o+zSntVZkcT5Xf0Hs9/9T32e
         S2hg==
X-Gm-Message-State: AJIora/RRFSinTx/EloaHymgHXC858Z3BXmZT3sh+Q+0mJxOVbpF3lYt
	tIqizFGf89WJuCMo6Wa0HiCyMZdvMUECUw==
X-Google-Smtp-Source: 
 AGRyM1v27fs+SY1GM3xMq8qHOnfRYVwxUCQYIXw4jEY/dL2jatTvjGTwnuGShq9CrTFliTLNbLDLXA==
X-Received: by 2002:a05:620a:c8c:b0:6af:ce4:5d55 with SMTP id
 q12-20020a05620a0c8c00b006af0ce45d55mr6340671qki.554.1656597727667;
        Thu, 30 Jun 2022 07:02:07 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 b20-20020ae9eb14000000b006aee8580a37sm15056113qkg.10.2022.06.30.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 07:02:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/edk2-firmware: devtool changes
Date: Thu, 30 Jun 2022 10:01:51 -0400
Message-Id: <165659771136.3152302.9029650295569486031.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629130142.20544-1-jon.mason@arm.com>
References: <20220629130142.20544-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jun 2022 14:02:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3547

On Wed, 29 Jun 2022 09:01:42 -0400, Jon Mason wrote:
> Make the changes necessary to allow for devtool to be used on edk2
> sources.

Applied, thanks!

[1/1] arm/edk2-firmware: devtool changes
      commit: cab723f0154c8fa7a1ae8719653565370fe5cd03

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

