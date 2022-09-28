Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57293C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:09 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.8007.1664372520335556861
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=7WyQH0/3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id a20so7905611qtw.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=JWnIYSJGr7IbzUlfvPYmgH2ZlIDDr0i5sTTi3QWavKA=;
        b=7WyQH0/3qv98Eron7iOLxj+PwRV+/ges3hTm3nOL8OtiP9yYBQvCrgYeSzd7k4ccz+
         e/TH4aZhzi4WiPL9ANPEltZwNacmlBEcKO/IOBVXkv4A2j/FfJKUoU+ts1mb0hVf0HiQ
         oWkJLzRhkRcGS/Wyynpm2NZCU4Se3pSNY0Np/Of1Zt0BQwQBGbY6r112CzzWzdgfkLTt
         CZwkzOxma8XfLANU/rdEC+pzy9tp0Jois0RmojCWpUEHWyIBz1nlooXLw9OL7zOC/DgA
         zDFqkECQuM31XJMZZEx7IF9OFVI+XlW/9b+t5EdbF+I4WlkYwCQD/bk2E5EC1ydJ/O5s
         US7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JWnIYSJGr7IbzUlfvPYmgH2ZlIDDr0i5sTTi3QWavKA=;
        b=GpD8vUwrrLLW3oQN2ko8eYDQqMNaXMt2rxsFcsRGLHviIWuW2jworLz3/HAOaXMWEV
         D2O8qNiYtJaRyvx7M+AA5ZP5Sa3DUznwivSAF/1pRkn52cpRqWM892W9AZI8MU/hxLyU
         H1y1pRnN9T+tnK/6rIBk3Go7gL352A9zJ2StqX3617P45lXIzXL+iAe7ufxVJpk+5eEc
         PdyulT59M8SP9J4f9YAbZasktWVJvLWHLElhAs0gqxqXpTRY+2JHlQiGaRFPVsiyq+ah
         I83dbOCBDpvhtYrhRigQdyFjAcBCZJYwwCTe3KT+Jn7RHBZU0LHBmLBWbNk4HpBrdbFz
         yLjg==
X-Gm-Message-State: ACrzQf0YZQOrWeahCLgGP19F7GWN07BE4quwxltGh1nIJtfPWziSl6MJ
	GP8AfOFgiLyURwAJaCzx2NnvxDfYOjuXMg==
X-Google-Smtp-Source: 
 AMsMyM5AAfmILXzlnKZjRRj3EVL43tpLgB0LohTzlDjtqPyfbxabPDGaQaf6QfKo5QljBgn5mmbADA==
X-Received: by 2002:ac8:5bc5:0:b0:35d:129b:5104 with SMTP id
 b5-20020ac85bc5000000b0035d129b5104mr27669547qtb.237.1664372518870;
        Wed, 28 Sep 2022 06:41:58 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a05620a0bcc00b006af0ce13499sm2906673qki.115.2022.09.28.06.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:41:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jiacheng Tang <jiacheng.tang@arm.com>
Subject: Re: [PATCH kirkstone] arm/fvp-base-r-aem: upgrade to version 11.19.14
Date: Wed, 28 Sep 2022 09:41:40 -0400
Message-Id: <166437250049.2314763.13139123485021611298.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220927135627.1506892-1-jiacheng.tang@arm.com>
References: <20220927135627.1506892-1-jiacheng.tang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3850

On Tue, 27 Sep 2022 21:56:27 +0800, Jiacheng Tang wrote:
> Update version in documentation.

Applied, thanks!

[1/1] arm/fvp-base-r-aem: upgrade to version 11.19.14
      commit: f8adac6890654f959115233dbe5e0fa20dd3685a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

