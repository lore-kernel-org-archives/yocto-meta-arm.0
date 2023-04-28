Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3010C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 18:50:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.28894.1682707842656619439
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 11:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=H3cl/Qrq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-75131c2997bso739557785a.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682707841; x=1685299841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIqKuG2XlbU8b2sAkKGeiLc9sSPWc00SUd21ay5p+uo=;
        b=H3cl/Qrq2OJ95hpGu3owzKgT/XT+/csrSCP5oiTpyVKT9c/ZR5Ibabiti/9Pt6CnZy
         TT9TfZMmgOaPEoYlZ4WRhYe1l0V4X0BQ+BVI+0mvUsBOglsNxRfkAzpAAQEa6EyAnP4S
         glMHqDE8ZvVYcOyEnsu+pFj+3bcPv4eLlB+hB12R4OR5iKjybrSaYulXK+eGZ0cJ8K4m
         Yr10Z58yjzhyRmU0bKlBiEkwnOeLQ6X8kxmnUofG0FyY3mUdKn2tJfCkwtUKin9GaCRA
         ZM4CPrFJbR2pU+qWOOf5KlWhWCPOjIwf8Ipy5IQUX4U7QMrLhL4hQypJySFj+yD98u3s
         rHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682707841; x=1685299841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIqKuG2XlbU8b2sAkKGeiLc9sSPWc00SUd21ay5p+uo=;
        b=ZOh1agZGa1msMpcRPP2iMcD3jDFeYl9A0ZUQCACyHW2hD4YORZkw4Ctr0o3y7Kroa7
         UJIpNQ1LSkPOIrpLIMfFDkEHOYUbkG7qoWHKQXeX3IIkDiJz2/esDdq03WA9VXQz80+X
         R8qZnllz8l+vMnA5ZxHJ9deXHM+X5b82083xN21FCaap++r2lQsIpTP849BYnRnf483z
         /j21YOhIoRvk7r0eSR2m0baR9T6ceL5IYKPMyfI5hHealttnPrzQ/mPkttnb3VwyIFhi
         wZ0TKY4qZ539R9zgogpxFdIHPiv4dI1w8IUvtbtHYr+Mx1lZLlIwIAaCV55H1M05icQn
         RTGA==
X-Gm-Message-State: AC+VfDxtg7H8+O+2cmcjCRnPJkNtck5L21E3VC5hoFdk156KE514Y91m
	ydlZUrzqMfbrMV2N4/fhjllSTikoVvuZwF7OYT0=
X-Google-Smtp-Source: ACHHUZ5DJeBiBUhtc9DW6S5aRPXnSIl3TZPiVFRlidErtJolJagF6lKK4l9rTIqhDwNRrrVci7NyyQ==
X-Received: by 2002:a05:622a:1814:b0:3bd:1081:b939 with SMTP id t20-20020a05622a181400b003bd1081b939mr17513240qtc.0.1682707841051;
        Fri, 28 Apr 2023 11:50:41 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w4-20020a05620a094400b0073b8745fd39sm3400102qkw.110.2023.04.28.11.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 11:50:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-a: Update N1SDP to v2.8.0
Date: Fri, 28 Apr 2023 14:50:35 -0400
Message-Id: <168270783610.3573513.6669771063589398080.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230427160649.21922-1-adam.johnston@arm.com>
References: <20230427160649.21922-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 18:50:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4625

On Thu, 27 Apr 2023 17:06:48 +0100, adam.johnston@arm.com wrote:
> N1SDP master has now updated to TF-A v2.8.0 so we should do the same.
> Remove the SHA override for the N1SDP
> 
> Adam Johnston (1):
>   arm-bsp/trusted-firmware-a: Update N1SDP to trusted-firmware-a v2.8.0
> 
>  .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc           | 4 ----
>  1 file changed, 4 deletions(-)

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: Update N1SDP to v2.8.0
      commit: 7f0c57f7c637f89c3ed4f54d9580acf8b400741f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

