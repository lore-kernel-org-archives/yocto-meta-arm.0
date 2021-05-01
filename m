Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.11356.1619897269403442377
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 12:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=1rF4h8vo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id q127so1542001qkb.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 01 May 2021 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=P8jq+1Vv6UG2WEheCfZ3RjR2WubEHcvkB2JrZBu6jBo=;
        b=1rF4h8vot1QW75ZcFXW336gr0JpPyTaab7ihszXSg4wnM4DWWTs26MSArq1chYYsuO
         P2y43Kk5I98jIMEbolQBSdOHVBUvZgNEPQJrFa+25lntyvJVmi3L8oorsGnPXVVV904y
         o0RhvUQH/SN1SbpCXU/v0txPxCm+u84/QN6gniId/N1aJlnMQmofBGg1Gvve7S8riEZ2
         jP21Zqn5DUlqxIQivDvOWXk/y7WkSEFu0BgOYrGEWyl4bXLwLpJXATbhagmJNu2EFHvH
         D+d7QyFD7vzQnQ1LTDmuBK3poQVBf9tlVKLKZm8lPhdUTmFbez+4a/zUn3U2CmkmoUE9
         ++VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=P8jq+1Vv6UG2WEheCfZ3RjR2WubEHcvkB2JrZBu6jBo=;
        b=lSOCv+FMW0tGyn3ksKL99v0HyNDau7rUehtaL73YkqBqU6RDrvi/ANVdlibFxm56VL
         kI9vbzitsOfHAu/pum9j5TSCuZSIoJMVeTLvc5+dopjJfvil92cyX5QVIvXS2U5gxGFD
         wWEwonrU1s9ntc67RpGimbifviO2yLl3nygABuI+BYyi7uBMS6phMIy2tIys7nNjJVy2
         AGlHpuZs06piMYfei0CFz1f50zFjgNMkulwVMVV3Xt80oU/7qTzNOLnkPn4DhjMKYWN3
         RnCA7hgGBhBhRjLEvY6k2+em06YW7HSVKQZ1Od3+X4ovijbntsXCj3tTO43IEXFZfug1
         GS6w==
X-Gm-Message-State: AOAM531E6JBEMSSvzZVo4oM8bf5XAp6I4SZ5M1UgJE+oAFSEnWw19Y7N
	Jg5NMSDkSRaTMdPlAbyitwDWtcwpNKn9NA==
X-Google-Smtp-Source: ABdhPJxv4wee9o1K4BjnBAey3IVf5a9DCqNqJEkAKCwTNEFYsSbmNYJC/ea6Romi86YwZvZb2EAmWQ==
X-Received: by 2002:a37:41c2:: with SMTP id o185mr11755466qka.192.1619897268375;
        Sat, 01 May 2021 12:27:48 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:1c11:4abb:70dd:58e6])
        by smtp.gmail.com with ESMTPSA id q125sm4582271qkf.68.2021.05.01.12.27.48
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 12:27:48 -0700 (PDT)
Date: Sat, 1 May 2021 15:27:46 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm gatesgarth update
Message-ID: <20210501192746.GB20675@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

meta-arm has released an updated gatesgarth support tag.  The tag
contains 34 patches from between 12 Nov 2020 and 24 Mar 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.2.1) with a "yocto-x.y.z" tag (i.e., yocto-3.2.1).

Thanks,
Jon
