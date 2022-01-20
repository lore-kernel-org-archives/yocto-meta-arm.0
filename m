Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B46C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 17:50:34 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.15819.1642701034215656803
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 09:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=si5Md186;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id o9so3326146qvy.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 09:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FzFJX63zy+fvITW7JHPKXQplq8HI9YQDzzpCfcU3ASI=;
        b=si5Md186Of1sAV2hEH8PrLB1RF4RgVdF/YAq3f7Rwv7ZZhWpGtiAElN6gR5xPWjoHT
         bt4tNwlwjIIzvcoxnC/ScFnD0R93Bw1J3kPkeL8rY06IHFBeu3YbAvxMM8VDx+v0jJOd
         uvZBbwMfIziU7guzhD9wd+YUz8vkx79C1qMwIADRxhwNBNR2jNA7FLz8Tn//CoIgZ3P9
         wnkr3/4n7COVJJz6C8Tr6N/OwllZOKIkKfG4kseTwEeXA66rODRNrpv6SvJG0pHOhkek
         0ANtxso11wxBGVJacXDAahFyXg5VaRBSBQez3KL/QM+KqIE52gcmxoPm+zxWEKcF4E4Y
         1c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FzFJX63zy+fvITW7JHPKXQplq8HI9YQDzzpCfcU3ASI=;
        b=UMlXNDO0uCw/lRcT7CB3B0EQFe82AIXoMof7UjuuguS7H07TJ1MUuK9mKI3UJbsZca
         5J+iCvPARbmtIfzVxOZwecmKqgsvIx9iVbXK1185gpQCnxe5xuBlKRY76AMQFBaYgFWB
         E/s9uD6uZaxgQ8Zkqkh+9YP8FGJtQ3mA2nHSN53c3hLj028ou14Se+vJYNtDQiBJa20o
         hKVW1UdiQI1Son7yye72Oj6bQybVtNJJz/qwfEN/jLLe3p6mWBBWm1r/FBK5Ojk53cuu
         xQs0f30wdPFCZXaPuTFOywbRHL566C3suFvDxdXwH/ZgRxbvf+JUgMPprq7bvz03V4EM
         dQ4g==
X-Gm-Message-State: AOAM533H2PBdA/7jeaI4ZhouI0OXQ55Cz4Gu7DxgpPYgzhZvsDKB8yHK
	nzX+L0XcFG5dvoK23wAp3r35KZAHurOCHw==
X-Google-Smtp-Source: 
 ABdhPJy+7h4rgDOhLYLdqg7vyfLmp1sfeNHMU9wvazwBwUIBOyQLg5vXmN++EPgcW6WCw+sFsE4W2Q==
X-Received: by 2002:a05:6214:e67:: with SMTP id jz7mr40443qvb.4.1642701033277;
        Thu, 20 Jan 2022 09:50:33 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:86a0:fa:bb0f:c64d])
        by smtp.gmail.com with ESMTPSA id
 ay37sm1790358qkb.71.2022.01.20.09.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 09:50:33 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] Revert "ci: ignore distutil warnings"
Date: Thu, 20 Jan 2022 12:50:24 -0500
Message-Id: <164270102559.202212.13678137555083817730.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120163209.30603-1-jon.mason@arm.com>
References: <20220120163209.30603-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 17:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2882

On Thu, 20 Jan 2022 11:32:09 -0500, Jon Mason wrote:
> This reverts commit 63cb70be72f48fcf25fff9738536d2251ff4cafd.

Applied, thanks!

[1/1] Revert "ci: ignore distutil warnings"
      commit: 8601ba85f7e54dc7f1b9266fe63f3987f5e308ce

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

