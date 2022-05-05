Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DE2C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 17:13:39 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.14013.1651770810604265490
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=k2Ipo0lk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id a76so3617526qkg.12
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hm3KNlO7B8eVTmNeHNFjnLKY8yReWlwe3Zt/zpzyiCY=;
        b=k2Ipo0lk87fyRR1QU3M53SuURFmtUm0gy3XJK3Z2+lagmnacCWW+sbR2I9T2e66Sep
         gRafT6Kiz9m50VeklaZ4aC2NJhpPeA9mG/s39Ljk52s8onr6ZiFc3DFfxFLuhgQUXYlB
         VpcPwTiRpuEUNJaG24FQhPRxDpoeAx8tbMxYWJhfowY3YfSBo1TJ9vaQTCjJoawnxZJA
         QpaMu94bE93lPiAUkr3oSuIjgD9aUMCrkS6xy0r+YrnUGmoAzY6iIKzte+ymnkMY7jMA
         iqAQ4ZIEok4KGkPdYOX1rMz67ND69hgK+v1Rqtu/VzSzSOP8nPXjcrsm7GEnMSm35JUz
         EvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm3KNlO7B8eVTmNeHNFjnLKY8yReWlwe3Zt/zpzyiCY=;
        b=MSQKSUZIvzmGmU7WCdhhWTCITvbr2LX5gHIZyODit60PxrUy6elQD/t60qHfczB+Ax
         vuRnWIic2CGd0eLSfbGF536EwcOWGw/TnQksZv+x25kAUi4A77wmS29JUZF0nO9bw9zz
         tbO+KRLpzwP1/Ax3BvoplStPKpI4+tYjqgSg19FR6Dv1NwsmJR+Ln3alEgzX34n68nHB
         OU1XSJTlJ6lDietT6oTvGGIFmtz/EO+6BAfIeoM3+OKtWxXBryXgwcJm8eeMW0O341+P
         Y/6JMVTTwD/Ym0j+3/0C8RVpzeElJv6+5l9k8fG5jbGzA9N4kx//nccQhEd7gy6DsqTo
         u7Hw==
X-Gm-Message-State: AOAM530pFtkVOjo7UX4acfWj/nT21zON9UOlLUEXXbMLh+sMXD5Nn+7J
	S0S1gknA5SytRXj+wnBnIdipXjyDLJs6OU+w
X-Google-Smtp-Source: 
 ABdhPJxDkLT6Dm1QFOt9unehpBbrVNT3XrANSwDkFSNP+xw9G7VmMGtS/I2BWCmoR/zlOL7/oq0pfw==
X-Received: by 2002:a37:bbc4:0:b0:69c:3f31:3eb8 with SMTP id
 l187-20020a37bbc4000000b0069c3f313eb8mr20708807qkf.489.1651770809646;
        Thu, 05 May 2022 10:13:29 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 c15-20020ac87dcf000000b002f3b55328d1sm1169160qte.26.2022.05.05.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 10:13:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rupinderjit Singh <rupinderjit.singh@arm.com>
Subject: Re: [PATCH] arm-bsp/scp-firmware: upgrade TC to version 2.10
Date: Thu,  5 May 2022 13:13:25 -0400
Message-Id: <165177080570.3067469.3295800586722389733.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505102533.75226-1-rupinderjit.singh@arm.com>
References: <20220505102533.75226-1-rupinderjit.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 May 2022 17:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3370

On Thu, 5 May 2022 11:25:33 +0100, Rupinderjit Singh wrote:
> * Removed 0001-tc0-fix-sensor-data-api-call.patch as it has now been upstreamed.
> * updated 0003-tc0-rename-platform-variant-to-platform-feature-set.patch to fix merge error.

Applied, thanks!

[1/1] arm-bsp/scp-firmware: upgrade TC to version 2.10
      commit: 7793860123f40729695ed7a9930461d60781d700

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

