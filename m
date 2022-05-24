Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF37C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:40:07 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.10996.1653406800715979504
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 May 2022 08:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=IVesXmVZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id h18so1690937qvj.11
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 May 2022 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aAqmKDPJaD9Jz+dcLmQXDdkv9FtrGzTzuF24tP2LlfE=;
        b=IVesXmVZbXyCuBvNCWHX0h01vRfbrl2VMVuvb62VVjDu4HHusqUvKetfCVIBedYiev
         fQarqyXUKyxwxR3xYI+lGB4bA04YwsRTN9Zje6TIwYVpsh9NtEvdsmG8cPULsrsFTFX0
         SLE8vGrRlpYtgBA5JWOTznxUpTU5AuXQeDYY9p/F1T5ePuefVhUhXK/zNx0S8+UQKF3P
         6gzb4zk30a10JA99S9xSHYLmSpLosuIvYQvZHubZu4kPUpz63YAD1gnyBY9iIVnIJm0X
         mPA+tbmd5h6dn4JtIOfJD11+TQWfTsymTm+r70fq6MoqnQ/V5by1QUtWAhp7VUnGy5TJ
         6K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aAqmKDPJaD9Jz+dcLmQXDdkv9FtrGzTzuF24tP2LlfE=;
        b=CuVPXSYMRVo2l4GwMyVAi26wgTa2/kNysRLWkeKQlKKTXgCGuPZj0PINzWdxwE3qpP
         6j9a3jX0bBSEg71YJXca6vOjChmYsvv053awzJ2wjFxohZPlFHk8+tbVj0Noh/4ZH7qQ
         k8CCIVO3X6XL2GeHXXvXl4co5J8gibnMQkPzK6LAG1I2lBTOyR6+bK3jnJm4z2VnHGPG
         Z/0hKnKfXSxmZu2AMgEWSQvDot5jaJWLwYectbPT88WE+N0GKazSKmh39OtwHBiNaZUk
         IGNhGIDyX1Yf/1hR8czNctqJrZ2PUg6dc6wBMjhjVQ2ITGTsW+zBZiB2Z97yr25RQ1ME
         66Tg==
X-Gm-Message-State: AOAM5314gtZSAfxrEIU221oqXVBkaZuNPXIBb4kCezj169Ein+pTD1hg
	4uAjlFWtcf9Kqbaw+5EV30tUMIejANZnMY9O
X-Google-Smtp-Source: 
 ABdhPJyhNSX3306bY5owKqwZ9nRpFDuCyzXQaGd0SVytMucDIKlHPXNIDGbAjSyabuOzWhXHXyW4Ow==
X-Received: by 2002:a0c:ee2c:0:b0:461:d4bd:39ff with SMTP id
 l12-20020a0cee2c000000b00461d4bd39ffmr21839902qvs.109.1653406799761;
        Tue, 24 May 2022 08:39:59 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 v24-20020ae9e318000000b0069fc13ce1d4sm6253535qkf.5.2022.05.24.08.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 08:39:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/linux-yocto: move 5.4 kernel recipe to
 meta-gem5
Date: Tue, 24 May 2022 11:39:47 -0400
Message-Id: <165340678831.3120189.6689867725863268561.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220523143846.2645047-1-ross.burton@arm.com>
References: <20220523143846.2645047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 May 2022 15:40:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3464

On Mon, 23 May 2022 15:38:45 +0100, Ross Burton wrote:
> The only user of the old 5.4 kernel is meta-gem5, so move it into that
> layer to keep it separate.

Applied, thanks!

[1/2] arm-bsp/linux-yocto: move 5.4 kernel recipe to meta-gem5
      commit: f41c961992275fe5250d655f05848e5e926ce526
[2/2] arm-toolchain/layer.conf: remove BB_DANGLINGAPPENDS_WARNONLY
      commit: 232dc039d09267e6d27e60931d0355d308bdbbf4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

