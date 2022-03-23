Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC675C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:32:30 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.9110.1648042350506735712
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=K7AqLANf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id kc20so1188949qvb.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mPriQkIsZjU0TQwW6CERP9G5yhEZpostjh268XBdU3M=;
        b=K7AqLANfmKIBo9lnbuS+a0noTT2phNcoUDCs+qMJeKDoDKpiESqRRGFac2NsI5I+om
         PkU8dbwXS1P0kbiQockOIE8jymNGk+29UwhLekHA21iaFqHKMnQdl2YH42dG2SgVYWHm
         reG4ZasAy8Mze033wauGla32xXnDobTyFU967Nk71jTUe7Cr6sdT+PMmkFQPYjs1v2CN
         2LZr1EnHzVjn7USW+kN6FvKhY7CyyJ811e5Ck/S6A9mWdtgy3pDhgQ7qqpnMxhzuAkWQ
         gmyjIcBND0/7w42AEWlIZs8V9IuMowdPfM+3dQde0eC2iAmod0OGlalHIh1CpbGZAIU/
         M9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mPriQkIsZjU0TQwW6CERP9G5yhEZpostjh268XBdU3M=;
        b=sYWht2obRjknW2sJDF0joea0milS1rmHOaajhdbV1vHSdRSV/9U0Fl9kowvqthJlQP
         9q6EDUxBNMWD4Mhgkh6D5ifmlvyz4CgnlTaE98PKZhCgs1OaqccHJPU36Iq2tVGznWsY
         /32Ao6mXUQUXIA2hcm+N8gWJvIKV1Q5ctZ4dSf/y0/T6UVVGYvGyqZ8ZFMQsBBTGd+Mj
         tEYCRVCcyHeZqjehAsETHvaK9u05En6srnUjbY+FEMvy3Y7Hf5ZlE4ZsADedHIV+VQiM
         wnMUONoBLPKfz6weivGK8O4qPS2Xv+HL+4JF3xKXQ1TotfH1/7INJ26O7SEVZDUAilS9
         YgwA==
X-Gm-Message-State: AOAM530VQQBKyu42KGb1DYxPwe3VwnmI5mU9jOp/DMdFf9GORStb5rE3
	UVr8IrUyYmPEpJtLT91OtU9Yd3JTYlWhpQ==
X-Google-Smtp-Source: 
 ABdhPJxbxFbQMfJla0vjNe0DMY2o1e5VXTtikShqZ//1+1YaHyk8hnq2CVa7kNXE6awmfBgq09nVHg==
X-Received: by 2002:a05:6214:5088:b0:441:96d:4271 with SMTP id
 kk8-20020a056214508800b00441096d4271mr16472370qvb.70.1648042349558;
        Wed, 23 Mar 2022 06:32:29 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 m16-20020a05620a24d000b0067ecf605ef5sm965420qkn.105.2022.03.23.06.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:32:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: save task logs when a job fails
Date: Wed, 23 Mar 2022 09:31:23 -0400
Message-Id: <164804228335.3978431.11610282815985529393.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220322152018.3417222-1-ross.burton@arm.com>
References: <20220322152018.3417222-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:32:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3204

On Tue, 22 Mar 2022 15:20:18 +0000, Ross Burton wrote:
> Create a job artifact containing all of the task logs if the job fails.

Applied, thanks!

[1/1] CI: save task logs when a job fails
      commit: 28acb5fbd4cd01db3673d700b49c5a6ed12da3eb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

