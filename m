Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D463ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 16:29:43 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.8533.1663777773195468918
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 09:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=dW74sEX5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id z9so4836368qvn.9
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=1/Wr4WswfRucOx1XDF3AJ9LKaOEVXcCftjv2fy8/jjQ=;
        b=dW74sEX5sKT5kVe05qsR4lgomf6DuogsvP0/Z0q17XNGdAz17L2az0+fOcUtjwADLS
         PWKXKR6ugWzDoEI7Zap3o+ok9mfEytomKMfVPWLka7JMzyL/u4Bmw6HcwDYRySa3kw4o
         yY0vFVg5YxgQ2eCuH8sK/rrLfY7DF5rQz/1gL1H/8T03sgd888PaGgN94m3CnLm2Qlej
         G3CKwwzUzc7VmgjdOiYtMeLpBsrZqi+0Ir7ZBDYmKSJvHsnR89XMm5UoMTZe+MXtpyC6
         62iKrzGhEfjfKxjBEPd5kspcppTfcWvwtWE2CYPUdHjdSmmjX6tVerlJ+3TmkaJEPId2
         /RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1/Wr4WswfRucOx1XDF3AJ9LKaOEVXcCftjv2fy8/jjQ=;
        b=U++WOXqgE5Wp2/qDzsL3ziWyvj9lDJ5IOPv/sBl9taPXV2xSeGEGg1l/KXiJpnxk/q
         IG7qC1QFZ9YbYQfJ7MJQvybnpP3dBel0DPQmWmhW+JTgQkfx1wnbs/pkvk8KGT+gyFW0
         PhXFiwCYm7hvc6bmYM7HBVl3L+lsYVkIdULBHxyW17rZV67srWTMu85sip2L4OifWOHG
         NOIqcuLOwMLj62ksRDGd/Jr+/ZOCd4N2iQNVqoOyaVn/URYHdEziNP6+aaRrahM8QsQl
         a6u6O58SksoZ4YosAmNQwN0XGDMLambwaDoR18mkEfdHhxycG7+28Bx2o7tO5ANNvV73
         DStw==
X-Gm-Message-State: ACrzQf06E8kD3GV4PDnwrlpGBuu0GVh7HZETMwuUhlCC/cdTJOBaRi1w
	0fLqdhSzmvAXH5fe5LV3m3Y1vwJdVxEt0Q==
X-Google-Smtp-Source: 
 AMsMyM7KPX7TuRfGp8GGZkVI0GcmfM6KAqTP0yors12VNfDFy3GuBJPrqdEloF5ZkAlDGZHg3MwnXA==
X-Received: by 2002:a05:6214:1947:b0:4aa:9e87:d032 with SMTP id
 q7-20020a056214194700b004aa9e87d032mr23510202qvk.114.1663777771943;
        Wed, 21 Sep 2022 09:29:31 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 139-20020a370a91000000b006ce60296f97sm2084091qkk.68.2022.09.21.09.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 09:29:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/hafnium: update to 2.7
Date: Wed, 21 Sep 2022 12:29:05 -0400
Message-Id: <166377774524.1593175.17691291494541069596.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220920223937.8081-1-jon.mason@arm.com>
References: <20220920223937.8081-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 16:29:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3803

On Tue, 20 Sep 2022 18:39:37 -0400, Jon Mason wrote:
> Update the version, update the patches, and drop the ones no longer
> necessary.

Applied, thanks!

[1/1] arm/hafnium: update to 2.7
      commit: c6bf835cefedbd5baf9bedd96d8659c425224fd4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

