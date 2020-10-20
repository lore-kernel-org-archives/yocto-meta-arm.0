Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.1481.1603226980498962245
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 13:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=KJaUSZ9N;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id 23so3450975ljv.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+fePwuZACGJuiCqIXfsb0R3dhYMLLouVygIRFbLhaX0=;
        b=KJaUSZ9NlO8UO8vTEdNa0gxOtmYtKMeV41RzEa3gP8l6VN6yeILUBD7wL8yCUciEuq
         uVKySIqnMuWzBHSAfmelWb9QUzfHc+Ff61kzeHgDz+NZJykqYwAD59uBphutAoJZ7nJW
         YdqX4XDCd8zGab/aKhjUqGv+InvRxYZLYQB1aSu4lyKVLFeQPcKvgf2w6PVbaMpr9e2e
         YMamTndQIVsAbkjUJp+1FtBYTyo5YlrIU6hIPdXkaL5dBGtrj4dH6cxsoGJftFuU5tAb
         Gvc97YFz1iZv/DGI46bq7rKKIgco3wTivZzyntTIVeX0C+GulFY/CfeGK1Ha+Inc1MfA
         ULVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+fePwuZACGJuiCqIXfsb0R3dhYMLLouVygIRFbLhaX0=;
        b=twb11UKxEPGoJe5RiDonORifLzWrUBDiiNU3k7FfIeSBAkV0QgJfyHkjkoiYlmof7x
         2/bGxuAqFjY7nmkQ/PZDQsKw8ppjs2eeipu/dhWgBpQd0tmKrGzdKSzQKOOLW4FNGaIF
         uxlG5oF+OTTWaccX3yORBLs1l8S7DTa1IgABIukC9cECxP2O0NhhNsJ1hivOvG8dUtMa
         GtG6nVTMQQpMqVWpMl3bEvPdjzfNNeGuIzUkLvS27hXrnaCnYUQppdqT173DTT0MzW0V
         3IawhrCbL1PAKXdaHVZoFOd2KJHmVRWKsVuNI9OmCQtBDKM+1Lt8Rv+OqcGoNvYIhGdZ
         Ob1Q==
X-Gm-Message-State: AOAM530I+acbAJnXy9ou/nFsTefDT0nT+v70oJMl1cl+tfmlrg0VB87x
	j51YswYc3ZSf7zyqtFszRk+Z+QVw/x8iRBwlh+Vrqdygoz4GkQS7
X-Google-Smtp-Source: ABdhPJxXGFo2U2grEW7ewfaCK2ypsJZLLJyNOczgWQR2mTk+4DXE60iQZ3FRmjAVwbegaLqwqvG/CNbyHVSj9Ktj1JM=
X-Received: by 2002:a2e:9eca:: with SMTP id h10mr25973ljk.352.1603226978632;
 Tue, 20 Oct 2020 13:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201020160136.473402-1-ross.burton@arm.com> <20201020170718.GD19155@denix.org>
In-Reply-To: <20201020170718.GD19155@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 20 Oct 2020 21:49:26 +0100
Message-ID: <CAAnfSTsEHWvURC8hhLwYXuC6x9KkPd6_9=GOzK-mvhquTyyL9A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/layer.conf: add meta-python for musca
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2020 at 18:07, Denys Dmytriyenko <denis@denix.org> wrote:
> LAYERDEPENDS changing based on the machine being built? Isn't it rather
> backwards?

Only a little. :). There's some meta-python dependencies that are only
relevant for the musca boards.  The alternative are:

1) Don't add this dependency and get missing recipe errors when
building musca without meta-python. Bad.
2) Always depend on meta-python, although it's only needed for musca.  Bad.

I consider this to be the least worst solution.  It doesn't fetch
meta-python if you use layerindex-fetch, but you'll get a good error
message in that case if you build for musca.

Ross
