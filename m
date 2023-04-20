Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE15C77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 17:04:11 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.1444.1682010241630384672
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 10:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=dcnfILuv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3ef31206cbdso4432231cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 10:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682010240; x=1684602240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eNZZA77JK2pJYGZCAhuKTBnga8IhNgHuRBDkGZdCOA=;
        b=dcnfILuveodGztIdROX2pNxcKukbMf4X03Sw+TGf3B0MHMP4tpQ3SQryaxjHivZEJS
         lQYutyisfF1K2uaUY2ikBKkBCYKQJvvwCvm+Zug7MVtQhppcG/X8Acu9sgl2NV/jqogt
         LYQlce2L4117Dqk5DJdQ0jpY04UIMY/eufJL232CMiT4WTW1FfdNL2X0D7mQhLbLsFtR
         C0ieBxwowD3tT4yL4Ch73Hm3ETzANLu3lZxM2uXyISrRCH+YtaVr/79PgLmgXMBcAtPd
         v/EEKHUHxm8lO106763zNFpoQzrFH2M25xEJ5y6XqCqaRkxXQKeFcCdthncAj/JYJ5S7
         3Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682010240; x=1684602240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eNZZA77JK2pJYGZCAhuKTBnga8IhNgHuRBDkGZdCOA=;
        b=MxL+HLCSuT9KUUXMaadUxA03Fa+6RTus8chEeiYrdZhfuZj29Zoe0zoMPpsYIXntzg
         KW+BkI60heFWBfy9VGuJX5YW8sxXGReSKOUSp8bPIJKypHmoHc1XDP59q99Zr7sOv9yQ
         pSIEHfCeBw82RwEuZk5cIYHWESJgZOdziOpYQAvZ2RipeXZTCVKFY8J70ocH3+1VkTco
         4Q74xnesF53TlZ6a8Ca6HyOJ2JOxnIb0zrvVBVhI5BJmq0PZixZkQtS7rKO6hQZK9Rip
         JEdAn4f5RU4xYaQNHh3s8+K/su/zuAxRLG+A3SmnUkwN+f1xm70DKrdGbmOFFKQUfpnG
         tBiA==
X-Gm-Message-State: AAQBX9cwO4iCDuAhpn+I5V8OROoapYiLzC4bR0quOjVOg+Awy0vGVcmx
	58WCO+TtmDx3AhHodAQcxRvvj+ZcQJRpPechXZg=
X-Google-Smtp-Source: AKy350b3tBhgFpyO0xreaZpqhYQG2eQlqJkw2fGy8w8tVwnDdlsFi/V8sFPJ8Rumm94KjczLi3ED5A==
X-Received: by 2002:a05:622a:296:b0:3ef:3395:de49 with SMTP id z22-20020a05622a029600b003ef3395de49mr3494283qtw.2.1682010240263;
        Thu, 20 Apr 2023 10:04:00 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id px6-20020a05620a870600b00749fa9e12e9sm552321qkn.124.2023.04.20.10.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:03:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/tc1: Fix signed u-boot
Date: Thu, 20 Apr 2023 11:40:03 -0400
Message-Id: <168200520626.413166.15066801629412072919.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230420124642.662700-1-jon.mason@arm.com>
References: <20230420124642.662700-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 17:04:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4600

On Thu, 20 Apr 2023 08:46:41 -0400, Jon Mason wrote:
> Recent changes in upstream u-boot recipes for signed fitimages, have
> caused the existing code to no longer boot.  Add a newly required
> variable to get it working again.  Tested using tc1 FVP.

Applied, thanks!

[1/2] arm-bsp/tc1: Fix signed u-boot
      commit: 173c9d887e13a20a0fe337c55dbfeeb975514956
[2/2] arm-bsp/tc1: Add FVP support
      commit: 2d8bc0be8e25b09c06ebc8792b306c951d18b8fc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

