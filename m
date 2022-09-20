Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69284C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:36:57 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.3553.1663713415830989246
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=nXLBUhc0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id s18so2908279qtx.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=PwPfQYxPYZLAx5UmlcwNUCnt/Iqfig0q/uFBKcbJSSo=;
        b=nXLBUhc0DctW6Eh/CqVARN2mGRxTO8kTS0R8IqhhydmfvrUq6nCor2dTLEJwEs39Qj
         YICobTpQ9igsdfT6X1hxq0fkxuG+PcZQKrPCmzB1x8oVaBIk/BKH4uy87Bi8EtE7CPdK
         gXfHDOJ6IrWHc1dS+LlFuNSpxvJcuKEjiP5hUrikaxXiN6ZupbyMCnvMxEd2eNToDD6+
         o76D1ZWv5uQhlpmtqq9N3d7vvS+XMhCqu95mDavQWW97CPDxlSuz5Pzs6JsoHtRVuShM
         Yw+Gi4e5xY5d+5oCl4hnCGLBN2GyXg6SNBqC7Dxmk06Rxj8/+aGE3mzjUxzuPgMHItkY
         Z4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PwPfQYxPYZLAx5UmlcwNUCnt/Iqfig0q/uFBKcbJSSo=;
        b=ipmHTw9SRPdhW8V/lBM0GKvUVqex4ZiT5IdxWAcoQRzw8Plb7DtfQBbGCjQWdBQQ5Y
         2zYPLg+83W/GLs7BrCEN7EE+jYMDppJLt2WYnXKi8uHHhdHqdwxoaPyLkrACId473buN
         vJlWrdhBl7t2VeqniRnxLMYLA9Szc+EtFIK02Acmv5joG30BhAgW19ZcEy0yZ41T4U7B
         yc/JnoYH2jQWqCRaTm5dP6uolt1+NLyppkkhQfsD3GiCYEy6grSHfrYsdD3QMrwODnSI
         hAJR1MkkQMBhaG+dx7WjQE9JcfJ0eLUuf5W29rmXwwv9oxwLMwz3Gz33NryhamO7nahR
         mNSA==
X-Gm-Message-State: ACrzQf0ogNBXuULIQHrKZWabN/D8DB5DMpZp+UkbPTrOA3jUZ15OTOud
	/YAXo+i3ZQjpStyS3ppq7qJeT0S5mPZfmA==
X-Google-Smtp-Source: 
 AMsMyM40HSulhVqd3Opcn+woB0Gh6uInQBFeeAGX48DLnQpdUE4rbPwj0OIHPeEpxigSz0AtN3I+mw==
X-Received: by 2002:ac8:5a81:0:b0:35b:bbb8:6481 with SMTP id
 c1-20020ac85a81000000b0035bbbb86481mr21856512qtc.393.1663713414556;
        Tue, 20 Sep 2022 15:36:54 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h7-20020ac85047000000b0035d0520db17sm379679qtm.49.2022.09.20.15.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:36:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Davidson K <davidson.kumaresan@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/tc: upgrade version of trusted-firmware-a
Date: Tue, 20 Sep 2022 18:36:45 -0400
Message-Id: <166371340602.2604237.1664573469605590314.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909065927.11581-1-davidson.kumaresan@arm.com>
References: <20220909065927.11581-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Sep 2022 22:36:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3794

On Fri, 9 Sep 2022 12:29:25 +0530, Davidson K wrote:
> 


Applied, thanks!

[1/3] arm-bsp/tc: upgrade version of trusted-firmware-a
      commit: 18e68367e058254e41e51911471eb0706aae0746
[2/3] arm-bsp/tc: upgrade version of hafnium
      commit: 3b48207cc760962b377ee332eda287383d06a55a
[3/3] arm-bsp/tc: upgrade version of optee
      commit: a9a53e258a025bd340044951a9b6beea9f2d9219

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

