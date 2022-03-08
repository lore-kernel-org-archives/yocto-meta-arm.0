Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDE9C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 15:15:03 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.8924.1646752503322744441
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 07:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lAFxuNmP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id h196so1402315qke.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 07:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gdnTC5GlaJDVW9lUFPMWe//nA+PkMVjxgkA5zao9D+w=;
        b=lAFxuNmP8Zl+AUAyMqphbrb67nYVj0HpQFORUhwM0J6gsaX4ifVzx9RzEeSLQSk4XT
         SbaBPZ3M4dZ4M5qiWN+3jQ6GdvXlUCvfElX8ifKLM4LNVsRoStl5SYwmYZhQnt22s/NT
         RUtFqg6ZwQvbp84HoPjc1wcXqG/8zl959yeM2B5re9+fiLsHFKcMy7vUPqd4mQyHCTVa
         jrt3gqXRhXPyPagEImU/wTe5DyV3PpH8Ci1zKDf5UqsExubo4/fUEOjn2efoNdojZ8tg
         NLCfzt2T6uKIWO2wXds6oPDlMQ9hhwm3Jy8rah4ML18iIHpTb1RZUhV5BAMnCZ1nnaIo
         x3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gdnTC5GlaJDVW9lUFPMWe//nA+PkMVjxgkA5zao9D+w=;
        b=Fhjqt8XxehhghtLdhfqE9RXvRqlUYGlU/WKo3yqORlCh9sxseSePy/5RfgStwnKqCz
         Nk4teSviTXKi/SV2d+HMC6oz34lt6ZPZoGtVzRwASPF3qJyrV86XaL7OG5W1TR1GsVHm
         OYVRpr5KuPFtTy3f2KAXTRqv2TdFkUTsjIDm9BBSjBZkSZTORTSbklf9JYVT6vfaQ5dk
         DbnZzR9SbggjRJRSZD6xVVs17/jwisjj5lnlJkCFVFZ9u5n4TpKKwCpv15SpZ/f8pzpM
         aAv7ySxbBlGxV9XbbOulAhRn2+dylJUIygzKlH+td1fwENjR9146MuDz5BTGNLAyU9zc
         /rOw==
X-Gm-Message-State: AOAM533Y+QOEHXgmCgNeZiVmzqQyxmkXWhXLJq0Ug2IRXOnk1EU8oAqH
	2ZUflt8Eg+RPzhaNcRt2hqCi4UzxTn1vKA==
X-Google-Smtp-Source: 
 ABdhPJw8JBjaenrKxXOU98OeVmW1LLLuk680XrNUggUx3li9d+9e3YQ3F1pZJbkqH+Yqg0aQFDJjqg==
X-Received: by 2002:a05:620a:f14:b0:67d:1b1c:cf34 with SMTP id
 v20-20020a05620a0f1400b0067d1b1ccf34mr1733400qkl.479.1646752502154;
        Tue, 08 Mar 2022 07:15:02 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e36c:6a84:e7f7:3230])
        by smtp.gmail.com with ESMTPSA id
 n1-20020a05622a11c100b002dff3364c6esm10980307qtk.19.2022.03.08.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 07:15:01 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 0/2] meta-bsp/corstone500: update u-boot and kernel
Date: Tue,  8 Mar 2022 10:14:14 -0500
Message-Id: <164675245458.524244.5837902304448425507.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307211931.457610-1-rui.silva@linaro.org>
References: <20220307211931.457610-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 15:15:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3133

On Mon, 7 Mar 2022 21:19:29 +0000, Rui Miguel Silva wrote:
> Update patches and recipes to bump u-boot and kernel version.
> u-boot -> 2022.01
> kernel -> 5.15
> 
> Cheers,
>    Rui
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/corstone500: move to u-boot 2022.01
      commit: 5c83fba36a78c5d8567cea70060d4b57cfed95ab
[2/2] arm-bsp/corstone500: move to linux-yocto 5.15
      commit: b40e705945af56ef36794abadf18106da0c66a89

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

