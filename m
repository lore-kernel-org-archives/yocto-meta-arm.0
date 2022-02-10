Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3891AC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 00:59:32 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.4152.1644454770837234947
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 16:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tva8yNz9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id o25so3351080qkj.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 16:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bRPrZihcj4i+miWG6Nf3tksACmaW4yOZuQvR8pXc58I=;
        b=tva8yNz9nHpDN0p9wTEcSf19kgbNWwQmnlO1OfiqDZRmqAGpy2pnJhU075175SUrKL
         LQW3ZLjH4KREjFYStAGR3jUpkPVXl1QSH1SlTekvuOy4RYGze0Ug9wRCtWA0BWG4QMao
         0fKOqCHVemUm+HffR10Kzfxv4PE/2Nf82aWkHHMrO8XKmpVvXLaRgaCinh36wKZlovVR
         V8hTAOtXGb5KhSvPJ/58fPGugB/JLiI7D2JqBxKY1WGPv/9R0QMAwLXzHiobgpd9g5Dk
         cTumpYo0iNcMav1G68mCaWQ6xZmSGdMlbBp+5u6nmr4UJYoXZkqh4Gaz7v8yvt4kiDpB
         ZDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bRPrZihcj4i+miWG6Nf3tksACmaW4yOZuQvR8pXc58I=;
        b=p8IgKdIDTIVx47COYC0gUoOC02CNiCFfNbDhDNhvqhKXmmr6rg8ApdihnxTgZBEJ+t
         e4sKMmEvJCgj5uM0vioPBNlRw52U2G8CnDX5LOugtARkX+dgITJLb49Y8aGYUvAoBE86
         34THQrNNXprmKTcdUJV+dKUXpFzo+9cHbrRVgA6r9fQafZmmloIpjAU8v2A+7mtoTDSP
         anqkqx0WPaFbpYNt18Oljvq3O4B+qwxrT2TKksohHMYw9GL4IZU0KZ2R63OyCP7sZOWG
         dMrM5llEcpMKqDmQRNGhWi2+4UXAQn+ZMaFem8Z9UEkQG4hcM8poSYORtndUIzTIOiE6
         JB2Q==
X-Gm-Message-State: AOAM531+QkKW2KNjmONMyE6cI9MzIlesB+SzaziCI4FmLarThFfR3Xwj
	MCimFDl9dubKzZhHrfvNifX3osGUtZA6Tg==
X-Google-Smtp-Source: 
 ABdhPJyWWAZc3tbNyjOzQZnZgzZIvaIsi5ZxEC76jx4wzZQBiVAwl6M1keH2Yjl6O/LFtUByZ7MdWg==
X-Received: by 2002:a05:620a:21d9:: with SMTP id
 h25mr2693781qka.322.1644454769816;
        Wed, 09 Feb 2022 16:59:29 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:4a13:d3da:c114:3dbe])
        by smtp.gmail.com with ESMTPSA id
 u35sm10166912qtc.26.2022.02.09.16.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 16:59:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anders Dellien <anders.dellien@arm.com>
Subject: Re: [PATCH v2] arm-bsp/trusted-firmware-a: Update SHA for TC
Date: Wed,  9 Feb 2022 19:59:18 -0500
Message-Id: <164445476241.3984483.9845146488598577244.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208085523.25594-1-anders.dellien@arm.com>
References: <20220208085523.25594-1-anders.dellien@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Feb 2022 00:59:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2974

On Tue, 8 Feb 2022 08:55:23 +0000, Anders Dellien wrote:
> Move TC to an intermediate SHA based on 2.6. This SHA includes
> patches for:
> * Support for 8GB DRAM
> * Support for GPU
> * Removal of kernel command-line (not needed, kept in U-Boot)
> 
> Also removed patch that fixes build problems as the problem has
> been solved in the updated SHA.

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: Update SHA for TC
      commit: b0913dc09ba8907467baa21be7ccc065526b8548

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

