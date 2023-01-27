Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2594C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:25:01 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.109867.1674843897862432152
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=XPH94NM8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id k12so4456071qvj.5
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QqbbB/6qLr0KO3XybhZOK3ItcvxzFRpUTxGTGnCYKY=;
        b=XPH94NM8avQ8UpdriT/ynNOBGp7GOeRrxWG5OmKevSXQ2F+uibM0Tvt/Nny3C53h8v
         wxHn2XyhHdkMDvbVI/gKtgy/nDGliYcKDSHK6MXh9xIhNwyUmNYiPRMkFZMqGGcC4sQq
         tUdcB5qqGXs5In0fYVt/AOqnXMjUv7S3hfeTCZZFhy3JxXeGMij9KMcj5pt5MBIGu63k
         iMRStyPEr6sAdH7nJ6hH/tnDb6sCMit7WyDRkmKepC6wYYaVcoDzXxhm/gQbAWF4WMS7
         qyRBYEvWM0z9aYGoXPdcPNp/uIrDpLmfOPWNz5FkgIAPpXpoRUVhxjB7coBf0zo+BMfg
         nobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QqbbB/6qLr0KO3XybhZOK3ItcvxzFRpUTxGTGnCYKY=;
        b=3CpQXEdLrTkxD/rt8DJk13nMlJQT6RlEFUeJIpeuwbY8tjYwxNhbjG1EQ2DE2IphZv
         Sp3GZVIzP4uw6cfOe9eGN19yencIt6kG46WJ1d7FSyedOKMt8VZJB97FJA37kNcg1HuJ
         Y3/j2rSLAUXhyk7w83WXaSJ0COkqGaMyTjpOHOg6JlF0hzs1JgUMT8WqY/jwiTa/HBv1
         KHx2+F+Es7hdZ1pXF9feTzB7SI1qLhKlOg0c66EBWiOjplfKikTMFXGEYrIQ0DPcfNFP
         eJxKtEPRmnt3ygXzOjCKVCWlpNWoV0WStTZUQsPDbg3DqnrxLBMGnARJRWmF0D8WGCHZ
         0SbA==
X-Gm-Message-State: AO0yUKVBt7au3i+g5OPXwIkrbe6MFfC5wn1Bm9xud4rdrJtQcdHo6ZfL
	eYyXkKvYAQ13vJXUdgeSgd4cnP3/8H+quq8x
X-Google-Smtp-Source: AK7set8MT6mdGBNcTqAVoxxLXaCVBi6rpCuiX3XUM+9e1mHPDn6sMIs+6xw+OO5g6/NFyAAPHaGwVA==
X-Received: by 2002:a05:6214:a44:b0:537:6cec:98e3 with SMTP id ee4-20020a0562140a4400b005376cec98e3mr17522006qvb.31.1674843896521;
        Fri, 27 Jan 2023 10:24:56 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id h6-20020a375306000000b006fa4ac86bfbsm3265137qkb.55.2023.01.27.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:24:56 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] arm/kernel: Update ARM-FFA kernel drivers
Date: Fri, 27 Jan 2023 13:24:44 -0500
Message-Id: <167484388781.842866.11251141798888735298.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230127153529.734629-1-Anton.Antonov@arm.com>
References: <20230127153529.734629-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4327

On Fri, 27 Jan 2023 15:35:29 +0000, Anton Antonov wrote:
>  New arm-ffa-tee and arm-ffa-user drivers are compatible with 5.* and 6.1 kernels.

Applied, thanks!

[1/1] arm/kernel: Update ARM-FFA kernel drivers
      commit: 3d51e1117db9c89cf1c0f16e9436f45f6381ed0d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

