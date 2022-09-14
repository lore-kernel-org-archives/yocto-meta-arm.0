Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8997C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:10:14 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.6862.1663164608632756654
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=wci3XQE1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id ay9so500493qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hI7MpA7TW2BACy5vV6DDIsBZLeAUYSVil5Fw67SJlpE=;
        b=wci3XQE1ua87+YEd/wHLFqg+GAWoVnJ/QdblGp31gQwEf/jWnDKaBK2r7zeaj4O0ex
         31ueMsXWZhcNNRWl8QX/j4QoRRv2l3g//it5T35aJHcFr6852d38KpplQftuHTnBAp0b
         fj1I1OlW7FFfE1lBIQREcZPTXyozcV3s6lsETHCId9SRmQNkTQV3Nkj5QB/fQrkk8T+N
         S0hrZwOrKhc0S2LF8BFkKKP+phU3rdghwhWl9QlzeePqlr4s8bz5DJqnOdmhE2UrW5YL
         0lWaqyLK35EemkWncA8VCt8jrXquUR/DkE/t6wV0WkJw8ZDaipPruzXkcxjEZ26BPhDU
         t13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hI7MpA7TW2BACy5vV6DDIsBZLeAUYSVil5Fw67SJlpE=;
        b=Z+MU5loE5xuU96JJSWOjURZLNPp5Kx0zcZ2vBaRSkeu1cmwPo18jK2qb34xpRrAk9o
         t42nuHRu08LVXgDAUelYaLRZeEpbiNIU33pjhuJJvsT8tDdxTGbFlt35tKKXVJrLSpFa
         v+1pSv/+XNppWKhPyezKbgOAlEUZ5bzLU97ct69NSsf1IK9Tkaey/RHs2UOZHbJ5n3+n
         WG4LEcKCJ80xOmLlGW/VXB0RuZN5AGyA1lIjnxz5C5PZEPF0sqDuKtTnOthEUP49p6NW
         s2uCPKI2njhRSnHl0BKdFyUKa83fynplZoJFGYHwrmEtMyu0G+gC1i68Q7uwTb5u2mPO
         Yf4A==
X-Gm-Message-State: ACgBeo0UcA3Ei7c/0viIe7FI7zKHW5V/hJHQHRzfMHsxTvI9fc9v42hq
	V6ZHh7NB6tuIyFR1Ey05CzKUUYXexK9/AA==
X-Google-Smtp-Source: 
 AA6agR6GxoX2HiS3nd5HTGmi0hx45DVpg0DgCD2+SrQx/GaEUaQog0f6uOFuUChGK28SExYWSzSuCg==
X-Received: by 2002:a05:622a:1051:b0:35a:63b4:46cd with SMTP id
 f17-20020a05622a105100b0035a63b446cdmr27836506qte.143.1663164607288;
        Wed, 14 Sep 2022 07:10:07 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w8-20020a05620a424800b006ce5fe31c2dsm2010639qko.65.2022.09.14.07.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:10:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH v2] arm/lib: Specify the FVP environment variables
 explicitly
Date: Wed, 14 Sep 2022 10:09:33 -0400
Message-Id: <166316457281.1963578.11485239604152891606.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913120850.1409443-1-peter.hoyes@arm.com>
References: <20220913120850.1409443-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 14:10:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3783

On Tue, 13 Sep 2022 13:08:50 +0100, Peter Hoyes wrote:
> It is sometimes useful to be able to configure the behavior of FVPs
> using environment variables, e.g. for licensing or plugins.
> 
> Add a new FVP option: FVP_ENV_PASSTHROUGH, which allows the Bitbake
> variables to be passed to the environment to be specified explicitly (in
> a similar way to BB_ENV_PASSTHROUGH). This ensures that:
> 
> [...]

Applied, thanks!

[1/1] arm/lib: Specify the FVP environment variables explicitly
      commit: 820a55d348bab5d1953a6f1386383139772372fe

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

