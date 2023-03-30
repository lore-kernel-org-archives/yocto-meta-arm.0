Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5ADC7619A
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 02:44:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.45832.1680230678242351043
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 19:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=wiQbwRGJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id oe8so15555409qvb.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 19:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680230677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWZ6V0msQAi9ydxx2Q+Wd+T8iMyn51a+AWotep42HME=;
        b=wiQbwRGJXdxvjjGGwwXeup4MPgaR9s1OipkzDfQCAMIG+Rvnof81l0UJfqzgAx24Fg
         2qiIsGD/U5zhD3E+m1gfAIMnBWTNNjngmrzaFojTjjdpmo1C9Y3r5pX8YmzLFeMK3Jxs
         KLH8a+W3v+NaLSQvPKHcOQsYzCLmIzNPixX6yCh/bgh8Z+maPbrdIJjygrb+l6q+IcFq
         Vl8uzNBL6q9twQCSanMIiQAvms98wUbzkn8VJlNjParNdpQqW1JMcEfkU0+yqKA7wFUk
         kLwROQUfKzMwxBKmhDDj2mHkYk9WqDj1nmhWd9S2nlC+j9ATt8sIwNWld8YBASJ3ehmt
         k8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680230677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWZ6V0msQAi9ydxx2Q+Wd+T8iMyn51a+AWotep42HME=;
        b=4wua7uHyNWbsO4bk/8ZjE9RxwhoGRo8LXXJDPjTtOz/doOKQjyYBp92WVrc9sow6SW
         M4AUn//xb9/6syIySMWxI/b/AITL9VH8fgUhI4fSzT0vJvALEXGWgXmzXV6yBrl9Jy1e
         6XRk2vNsvjj55QawQjjGVce7ITzirj2lyaLThGZt0HgTmqtGIqbarIILdQlZ2goN1eoP
         wjGrqSiVikTX4pPEansEC7NK30WsA9K5FzR0TFC4YLkWHznY3nnCO43bafIx7l6P7EaP
         sTN/QaZI4UaqNjEaqkM61clHg3RzmWZIX1SK63OTzAVTL9yp29/8SQxUX0cKZVWmhLF3
         DK+g==
X-Gm-Message-State: AAQBX9co30tRH7BJzIyRjhw/WWxhHzF+JZAvtTvFhbNoTD6TDDlCVFOG
	ajVtJo3YT/tdCHouwclm1ndHVB8V36jNqnmnphk=
X-Google-Smtp-Source: AKy350aPcRAL6uQ6st0Ze8qbZknMedt1nK7r3uUYSiO0B6y1dKV6MXBC0gyAS+NqMKNAqXJtunSQjw==
X-Received: by 2002:a05:6214:e6e:b0:5c8:f391:9442 with SMTP id jz14-20020a0562140e6e00b005c8f3919442mr38491338qvb.18.1680230677018;
        Thu, 30 Mar 2023 19:44:37 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id el7-20020ad459c7000000b005e1e999edcasm121951qvb.42.2023.03.30.19.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 19:44:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH] arm-bsp/optee: bump corstone1000 to v3.20
Date: Thu, 30 Mar 2023 19:17:16 -0400
Message-Id: <168021823621.3450077.6597357636606016260.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329161613.812217-1-rui.silva@linaro.org>
References: <20230329161613.812217-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 02:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4521

On Wed, 29 Mar 2023 17:16:13 +0100, Rui Miguel Silva wrote:
> Bump the preferred corstone1000 to v3.20, drop patch
> that is already included in this version.
> Create the 3.20 bbappend and remove the entry in 3.18 bbappend.

Applied, thanks!

[1/1] arm-bsp/optee: bump corstone1000 to v3.20
      commit: df726cbfad017c78f0b7d6687aa37b5d3c0b2e99

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

